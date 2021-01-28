class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)

      return head(:forbidden) unless  @user.authenticate(params[:password])
      session[:user_id] = @user.id

    else
      flash.notice = "No user found with that username"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to listings_path
  end

end
