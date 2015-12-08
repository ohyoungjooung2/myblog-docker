class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update ]
  before_action :admin_user, only: :index
  #before_action :set_user, only: [:show,:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
      redirect_to articles_path, notice: 'User successfully added.'
     else
      render action: :new
      end
  end

   def edit
   end

   def update
     if @user.update(user_params)
        redirect_to articles_path, notice: 'Updated user information successfully.'
     else
        render action: 'edit'
     end
   end

   def destroy
     @user=User.find(params[:id]).destroy
      if @user.destroy
       redirect_to users_path
       flash[:success] = "User deleted"
      end
   end


 private
   def set_user
     @user = User.find(params[:id])
   end

   def user_params
     params.require(:user).permit(:email,:password,:password_confirmation)
   end

   def admin_user
     redirect_to root_path unless current_user.try(:admin?)
   end


end
