# -*- coding: utf-8 -*-
require 'net/smtp'

def mail(name, to, book)
  configure :production do
    subject = "Vendiste #{book}"
    body = <<EOM
From: Federico Builes <federico.builes@gmail.com>
To: federico.builes@gmail.com
Subject: #{subject}

#{name} compró #{book}. Escribile a #{to}."
EOM

    Net::SMTP.new('smtp.sendgrid.net', 25).start("heroku.com", "app177861@heroku.com", "3d1ec11226d2024220", "plain") do |smtp|
      smtp.send_message body, 'federico.builes@gmail.com', ['federico.builes@gmail.com']
    end
  end

  configure :development do
    print(body)
  end
end
