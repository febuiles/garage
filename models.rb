# -*- coding: utf-8 -*-
require 'dm-core'

configure :development do
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/data.db")
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
end

configure :development do
  DataMapper.auto_upgrade!
end
