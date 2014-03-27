enable :sessions

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by_name(params[:name])
  if @user.nil? || @user.password != params[:password]
    @error = "something went wrong, do you need to <a href='/users/new'>create an account?</a>"
    return erb :"/sessions/new"
  end
  if @user.password == params[:password]
    session[:user_id] = @user.id
    erb :index
  end
end 

get '/sessions/destroy' do
  session[:user_id] = nil
  redirect to "/sessions/new"
end