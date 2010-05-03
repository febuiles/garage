# -*- coding: utf-8 -*-
require 'dm-core'

configure :development do
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/data.db")
end

configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://localhost/heroin')
end


class Item

  CATEGORIES = ["Programación", "Literatura", "DVD"]
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :authors, String
  property :buyer, String
  property :buyer_email, String
  property :sold, Boolean, :default => false
  property :category, String

  def sold?
    sold ? "Si" : "No"
  end

  def sell(name, email)
    self.buyer = name
    self.buyer_email = email
    self.sold = true
    self.save
  end
end

configure :development do
  DataMapper.auto_upgrade!
end
