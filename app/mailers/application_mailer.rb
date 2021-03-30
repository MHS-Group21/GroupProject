class ApplicationMailer < ActionMailer::Base
  default to: "mhs.group21@gmail.com", from: 'mhs.group21@gmail.com'
  layout 'mailer'
end
