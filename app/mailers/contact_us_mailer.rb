class ContactUsMailer < ApplicationMailer
  default from: 'Luminous<do-not-reply@luminous-id.com>'

  def notification_user(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => contact.email, :subject => "Thank you for contacting LUMINOUS")
  end

  def notification_officer(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "luminousplatingsolution@gmail.com", :subject => "[Luminous Admin] Question")
  end

  def notification_admin(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "martin.me15@yahoo.com", :subject => "[Luminous Question]")
  end
end
