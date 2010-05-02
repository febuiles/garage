require "sinatra"
require "models"
require "haml"

helpers do
  def link_to(text, url)
    "<a href=\"#{url}\">#{text}</a>"
  end

  def buy_item(item)
    "<a href=\"/buy/#{item.id}\">Comprar</a>"
  end

  def buying(item)
    "<p>Vas a comprar <strong>#{item.title}</strong> de <strong>#{item.authors}</strong>."
  end

  def styled_tr(item)
    item.sold ? "<tr class=\"sold\">" : "<tr>"
  end
end

enable :static

before do
  content_type :html, :charset => 'utf-8'
end

get "/" do
  @items = Item.all
  haml :index
end

get "/buy/:id" do
  @item = Item.get(params[:id])
  haml :buy
end
