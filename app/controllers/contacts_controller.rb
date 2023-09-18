class ContactsController < ApplicationController
    before_action :contact_params, only: [:create]

  def create
    @message = contact_params

    # recipient_email = @message[:recipientEmail]
    # puts "Recipient Email: #{recipient_email}"
    # send_email_to_author = ContactForm.send_message_email_to_author(@message, recipient_email).deliver
    send_email = ContactForm.send_message_email(@message).deliver

    if send_email
      render json: {sent: true}
    else
      render json: {sent: false}
    end
  end

  protected

  def contact_params
    params.require(:contact).permit([:name, :email, :subject, :message, :recipientEmail])
  end

end
