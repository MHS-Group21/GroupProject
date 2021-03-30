# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
  ContactMailer.contact_email("PreviewEmail@me.com", "Test User", @message = "Hello, I'm having trouble with creating an account")
  end
end
