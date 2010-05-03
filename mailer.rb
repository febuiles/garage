# -*- coding: utf-8 -*-
require 'pony'

def mail(name, to, book)
  configure :production do
    subject = "Vendiste #{book}"
    body = "#{name} compró #{book}. Escribile a #{to}."

    Pony.mail(:to => "federico.builes@gmail.com",
              :from => "federico.builes@gmail.com",
              :subject => subject,
              :body => body,
              :via => :smtp,
              :smtp => {
                :address        => 'smtp.sendgrid.net',
                :port           => '25',
                :authentication => :plain,
                :user_name      => ENV['SENDGRID_USERNAME'],
                :password       => ENV['SENDGRID_PASSWORD'],
                :domain         => ENV['SENDGRID_DOMAIN']
              })
  end

  configure :development do
    print(body)
  end
end
