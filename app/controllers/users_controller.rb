class UsersController < ApplicationController
  before_filter :login_required, :only => [:edit, :update, :change_password, :update_password]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def change_password
    @user = current_user
  end

  def update_password
    @user = current_user
    @user.updating_password = true
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Password changed succesfully'
      redirect_to @user
    else
      render :change_password
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def register
    @invitation = Invitation.find_by_token(params[:token])

    if @invitation
      unless @invitation.used?
        @password = Digest::SHA1.hexdigest([Time.now, rand].join)[0..6]
        @user = User.create(:username => @invitation.recipient_email, 
                            :email => @invitation.recipient_email, 
                            :password => @password, :password_confirmation => @password)
        @invitation.update_attribute(:recipient_id, @user.id)
        session[:user_id] = @user.id
      else
        flash[:error] = "This invitation is already used"
        redirect_to root_path and return
      end
    else
      redirect_to root_path and return
    end
  end

end
