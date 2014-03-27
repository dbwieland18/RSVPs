get '/rsvp/new' do
  erb :"rsvps/new"
end

get '/rsvp' do
  # binding.pry
  @attendees = Attendant.all
  erb :"rsvps/index"
end

post '/rsvp' do
  attendant = Attendant.create!(name: params[:name])
  session[:name] = attendant.name
  redirect to "/rsvp"
end
