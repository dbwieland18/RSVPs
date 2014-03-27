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

get '/bringSomething!' do
  @fooditems = FoodItem.all
  erb :"food/new"
end

post '/bringSomething!' do
  @item = FoodItem.create!(guest_name: session[:name], description: params[:description])
  redirect to '/bringSomething!'
end
