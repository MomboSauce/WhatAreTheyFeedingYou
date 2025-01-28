require "sinatra"
require "sinatra/reloader"
require 'net/http'
require 'json'


get("/") do
  uri = URI('https://api.thecatapi.com/v1/images/search?limit=10')
  response = Net::HTTP.get(uri)
  @cat_url = JSON.parse(response).first['url']
  erb(:kitty_view)
end
