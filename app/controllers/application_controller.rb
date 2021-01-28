class ApplicationController < ActionController::Base
  helper_method :logged_in?, :get_current_user, :info_flashed, :error_notice

  def info_flashed (model_name, action)
    flash[:notice] = "#{model_name.to_s.capitalize} has been #{action}."
  end

  def error_notice
    flash[:error] = "An unexpected error has it occurred"
  end

  def logged_in?
    unless session[:user_id]
      redirect_to login_path
    end
  end

  def get_current_user
    if @current_user
      @current_user
    else
      @current_user = User.find_by(id: session[:user_id])
      # if @current_user
      #   @current_user = @current_user.username
      # end
    end
  end
  
end
