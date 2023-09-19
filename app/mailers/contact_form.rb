class ContactForm < ApplicationMailer

  default from: 'sojabio@protonmail.com'

  # send email from contact form
  # def send_message_email(message)
  #   @message = message
  #   mail( to: 'solene.jabaud@gmail.com',
  #   subject: 'Nouveau message de LePoticha' )
  # end

    # send email to author
    def send_message_email_to_author(message, recipient_email)
      @message = message
      mail(to: recipient_email, subject: 'Nouveau message sur LePoticha') 
    end


end
