class WelcomeEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    WelcomeMailer.signup_email(user).deliver_now
  end
end
