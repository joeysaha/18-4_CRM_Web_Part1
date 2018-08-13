require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new
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


post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

after do
  ActiveRecord::Base.connection.close
end
