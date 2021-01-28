class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  #before_action :destroy_all_listings, only: [:destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash[:success] = "Your account has been created!"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :age, :occupation, :bio, :social_media, :username, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def destroy_all_listings
    self.listings.destroy_all
  end
end
