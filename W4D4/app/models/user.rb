class User < ApplicationRecord
  validates :abuser, presence: { message: "We're sorry, we cannot register a cat killer. Shame!" }
  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true, message: 'yo mama!' }

  after_initialize :ensure_session_token!

  attr_reader :abuser, :password, :killed_cat

  def abuse!(cat_id)
    cat_id = (cat_id.empty? ? nil : cat_id.to_s)
    cat = Cat.find_by(id: cat_id)

    if cat
      @killed_cat = cat.name
      cat.destroy
    else
      @abuser = 'Not abuser'
    end
  end

  def reset_session_token!
    self.session_token = User.generate_new_token
  end

  def ensure_session_token!
    self.session_token ||= User.generate_new_token
  end

  def password=(password)
    @password = password

    self.password_digest = BCrypt::Password.create(password)
  end

  def password_matches?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user
      return user if user.password_matches?(password)
    end

    nil
  end

  private
  def self.generate_new_token
    SecureRandom.base64(10)
  end

end
