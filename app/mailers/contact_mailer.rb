class ContactMailer < ApplicationMailer
  default :from => 'hunter@verticalspanish.com'
  
  def send_contact_information(contact)
    @contact = contact
    mail(:to => 'hunter@verticalspanish.com', :subject => 'A new user signed up!')
    
  end
  
end
