class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    mail to: @user.email, subject: "Bem vindo ao CPTEC"
  end

  def convoca(sender, procnum)
    @expert = params[:expert]
    @sender = sender
    @proc = procnum
    mail to: @expert.user.email, subject: "Você tem uma nova convocação!"
  end
end
