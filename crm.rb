require 'sinatra'
require_relative 'contact'
 get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  @country = "canada"
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
