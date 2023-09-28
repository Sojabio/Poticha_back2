class ContactsController < ApplicationController
    before_action :contact_params, only: [:create]

  def create
    @message = contact_params
    recipient_email = params[:recipientEmail]
    send_email = ContactForm.send_message_email_to_author(@message, recipient_email).deliver

    if send_email
      render json: {sent: true}
    else
      render json: { sent: false, errors: @contact.errors.full_messages }, status: :unprocessable_entity

    end
  end

  protected

  def contact_params
    params.require(:contact).permit([:name, :email, :subject, :message, :recipientEmail])
  end

end
