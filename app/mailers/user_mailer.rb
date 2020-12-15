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
    @user = params[:user]
    @sender = sender
    @proc = procnum
    mail to: @user.email, subject: "Você tem uma nova convocação"
  end
end
