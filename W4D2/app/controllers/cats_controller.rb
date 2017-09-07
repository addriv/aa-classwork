class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to new_cat_url
    end
  end

  def new
    @cat = Cat.new #we do this so that it can be passed onto the partial and it can have a @cat var to work with
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat #this instance variable is being magically passed into :edit
      render :edit
    else #this starts a new request response cycle info lost
      redirect_to new_cat_url
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 404
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      #to understand where its redirecting to refer to routes
      redirect_to cat_url(@cat) #cat_url(@cat) defaults to passing @cat.id to GET request
      #another example for update: cat_url(@cat), method: update  (must explicitly state)
      #sometimes, different requests have same URI pattern, so must explicitly state like we do with update above
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def cat_params
    params.require(:cats).permit(:birth_date, :sex, :color, :description, :name)
  end #the purpose of require is to artificially nest the folowing params at same level
  #same in the corresponding view. the inputs are nested
end
