class User < ActiveRecord::Base

  # Inlclude following line if using Carrierwave
  has_many :user_files

  include BCrypt

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true
  validates_format_of :email, :with => /\A\S+@[a-zA-Z0-9\-]+(\.[a-z]{2,})+\z/

  def self.authenticate(args)
    args[:password] = BCrypt::Password.create(args[:password])
    User.find_by_email_and_password(args[:email], args[:password])
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
  
end
