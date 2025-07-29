class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: 'korbendau.felix@gmail.com',
         subject: 'Nouveau message depuis votre portfolio')
  end
end
