class ContactsController < ApplicationController
    before_action :contact_params, only: [:create]

  def create
    @message = contact_params
    send_email = ContactForm.send_message_email(@message).deliver

    if send_email
      render json: {sent: true}
    else
      render json: {sent: false}
    end
  end

  protected

  def contact_params
    params.require(:contact).permit([:name, :email, :subject, :message])
  end

end
