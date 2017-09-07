require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @req, @res = req, res
    @params = route_params.merge(req.params)
    @already_built_response = false
    @@protect_from_forgery ||= false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double render error" if already_built_response?

    @res.status = 302
    @res['Location'] = url

    @already_built_response = true

    session.store_session(@res)

    nil
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double render error" if already_built_response?

    @res.write(content)
    @res['Content-Type'] = content_type

    @already_built_response = true

    session.store_session(@res)

    nil
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    # file_path = "../views/#{self.class.name.underscore}/#{template_name}.html.erb"
    # content = File.read(file_path)

    dir_path = File.dirname(__FILE__)
    template_fname = File.join(
    dir_path, "..",
    "views", self.class.name.underscore, "#{template_name}.html.erb"
    )

    content = File.read(template_fname)

    erb_content = ERB.new(content).result(binding)
    render_content(erb_content, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end