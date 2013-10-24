class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :user_name, :email, :password, :password_confirmation
  has_many :project
  has_many :skill

  before_save :create_remember_token

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
