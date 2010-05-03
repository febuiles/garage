# -*- coding: utf-8 -*-
require 'net/smtp'

def mail(name, to, book)
  configure :production do
    subject = "Vendiste #{book}"
    body = <<EOM
From: Federico Builes <federico@mheroin.com>
To: federico@mheroin.com
Subject: #{subject}

#{name} compró #{book}. Escribile a #{to}.
EOM

    Net::SMTP.new('smtp.sendgrid.net', 25).start("heroku.com", "app177861@heroku.com", "3d1ec11226d2024220", "plain") do |smtp|
      smtp.send_message body, 'federico@mheroin.com', ['federico@mheroin.com']
    end
  end

  configure :development do
    print(body)
  end
end
