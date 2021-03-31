class ApplicationMailer < ActionMailer::Base
  default to: "mhs.contact123@gmail.com", from: 'mhs.contact123@gmail.com'
  layout 'mailer'
end
