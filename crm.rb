require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find_by({ id: params[:id].to_i })
  if @contact
    erb :contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  @country = "canada"
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
