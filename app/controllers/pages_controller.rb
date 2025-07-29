class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now
      flash[:success] = "Votre message a été envoyé avec succès."
      redirect_to root_path
    else
      flash.now[:error] = "Veuillez corriger les erreurs dans le formulaire."
      render :home
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
