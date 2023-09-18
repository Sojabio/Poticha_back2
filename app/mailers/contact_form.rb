class ContactForm < ApplicationMailer

  default from: 'sojabio@protonmail.com'

  # send email from contact form
  def send_message_email(message)
    @message = message
    mail( to: 'solene.jabaud@gmail.com',
    subject: 'Nouveau message de LePoticha' )
  end
end
