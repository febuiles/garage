# -*- coding: utf-8 -*-

def mail(name, to, book)
  configure :production do
    subject = "Vendiste #{book}"
    body = "#{name} compró #{book}. Escribile a #{to}."

    Pony.mail(:to => "federico.builes@gmail.com",
              :from => "federico.builes@gmail.com",
              :subject => subject,
              :body => body,
              :via => :smtp, :via_options => {
                :address        => 'smtp.sendgrid.net',
                :port           => '25',
                :user_name      => ENV['SENDGRID_USERNAME'],
                :password       => ENV['SENDGRID_PASSWORD'],
                :authentication => :plain,
                :domain         => ENV['SENDGRID_DOMAIN']
              })
  end

  configure :development do
    print(body)
  end
end
