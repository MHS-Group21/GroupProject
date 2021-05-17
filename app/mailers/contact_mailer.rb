class ContactMailer < ApplicationMailer

  def contact_email(email, name, message)
    @email = email
    @name = name
    @message = message

    mail to: "mhs.group21@gmail.com", cc: @email
  end

end
