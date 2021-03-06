class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: /\A([^@\s]+)@((?:[a-z0-9-]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  has_secure_password

  has_many :photos, dependent: :destroy

  after_create :send_welcome_email

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def send_welcome_email
      WelcomeEmailJob.perform_later(self)
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end