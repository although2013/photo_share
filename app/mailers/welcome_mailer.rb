class WelcomeMailer < ApplicationMailer
  def signup_email(user)
    @user = user
    mail(to: @user.email, subject: "尊敬的#{@user.name}， 您已成功注册xxx.com！")
  end
end
