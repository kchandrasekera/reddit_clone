class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  validates :username, :presence => true
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => {:minimum => 6, :allow_nil => true}

  has_many :subs, :foreign_key => :moderator_id

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)
    unless @user.nil?
      @user.is_password?(password) ? @user : nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
    @password = pass
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end
end
