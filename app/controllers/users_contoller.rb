get '/users/new' do

  erb :"users/new"
end

post '/users/create' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    "login"
  else
    if request.xhr?
      erb :"partials/_signup_errors", layout: false, locals: {errors: @user.errors}
    else
      erb :"users/new"
    end
  end
end
