get '/' do
  authorized?
  # Look in app/views/index.erb
  erb :index
end

def authorized?
	redirect to "/sessions/new" unless !session[:user_id].nil?
end




