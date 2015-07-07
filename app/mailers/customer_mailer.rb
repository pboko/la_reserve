class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.confirmation.subject
  #
  def confirmation(customer)
    @customer = customer

     mail(to: @customer.email, subject: 'Confirmation de votre réservation')
  end
end
