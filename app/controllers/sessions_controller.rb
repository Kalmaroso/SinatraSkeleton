get '/login' do
  #/sessions/new

  erb :"sessions/new"
end

get '/sessions/delete' do
  logout
  redirect("/")
end

post '/sessions/create' do
  @user = User.find_by(email: params[:email])
  if @user != nil && @user.authenticate(params[:password])
    login(@user)
    "login"
  else
    if request.xhr?
      erb :"partials/_login_errors", layout: false
    else
      erb :"sessions/new"
    end
  end
end
