class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to our blog #{@user.username}, you have successfully signed up!"
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity 
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Account was updated successfully."
      redirect_to articles_path
    else
      render 'edit', status: :unprocessable_entity 
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
