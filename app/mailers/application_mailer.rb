class ApplicationMailer < ActionMailer::Base
  default from: "\"Your SoleMate\" no-reply@solemate.com"
  layout 'mailer'
end
