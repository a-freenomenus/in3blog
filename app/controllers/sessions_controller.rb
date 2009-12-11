class SessionsController < ApplicationController
  def new
  end
  
  def create
    if using_open_id?
      authenticate_with_openid
    else
      authenticate_with_password(params[:login], params[:password])
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end

  private

  def authenticate_with_password(login, password)
    user = User.authenticate(login, password)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "Invalid login or password."
      render :new
    end
  end
    
  def authenticate_with_openid
    authenticate_with_open_id do |result, identity_url|
      if result.successful?
        user = User.find_by_open_id(identity_url)
        unless user
          user = User.new(:username => identity_url, :open_id => true)
          user.save(false)
        end
        session[:user_id] = user.id
      else
        flash[:error] = "Login with openid failed"
      end
      redirect_to root_url
    end
  end

end
