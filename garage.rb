require "sinatra"
require "haml"
require "models"
require "mailer"

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

  def thanks_for_buying(item)
    "<p>Gracias por comprar <strong>#{item.title}</strong>."
  end

  def valid_params?
    !params[:name].empty? && !params[:email].empty?
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

post "/buy" do
  if valid_params?
    name, email = params[:name], params[:email]
    @item = Item.get(params[:id])
    @item.sell(name, email)
    mail(name, email, @item.title)
    haml :thanks
  else
    status 500
  end
end
