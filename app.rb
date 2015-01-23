require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')
require('pg')

  DB = PG.connect({:dbname => "salon"})

get('/') do

  @stylists = Stylist.all()
  erb(:index)

end

post('/stylists') do
  name = params.fetch("name")
  @stylist = Stylist.new({:name => name, :id => nil})
  @stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end
