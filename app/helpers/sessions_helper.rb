helpers do
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
  end

  def current_user_id
    session[:user_id]
  end
  
  def current_user
    if current_user_id
      User.find(session[:user_id])
    end
  end

  def user?
    if current_user_id
      true
    else
      false
    end
  end
end
