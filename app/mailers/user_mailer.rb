class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue sur La réserve !')
    # This will render a view in `app/views/user_mailer`!
  end

  def more_info(first_name, last_name, email, message)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @message = message
    mail(to: "olivia@lareserve.io", from: "#{@first_name} #{@last_name} <#{@email}>", subject: "Demande d'informations")
  end
end


