class ContactMailer < ApplicationMailer
  default :from => 'hello@verticalspanish.com'
  
  def send_contact_information(contact)
    @contact = contact
    mail(:to => 'hunter@verticalspanish.com, jorge@verticalspanish.com', :subject => 'A new user signed up!')
    
  end
  
end
