class ApplicationMailer < ActionMailer::Base
  helper :application
  default from: 'marthyn@live.nl'
  layout 'mailer'
end
