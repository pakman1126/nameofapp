class UserMailer < ApplicationMailer
  default from: "pakman1126@yahoo.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'pakman1126@yahoo.com',
           subject: "A new contact form message from #{name}")
  end
end
