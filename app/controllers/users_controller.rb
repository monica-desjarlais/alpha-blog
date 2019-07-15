class UsersController < ApplicationController
  def new
    @user = User.new  # new instance of the class User
  end

  def create
    @user = User.new(user_params)
    if @user.save  #if user is saved (acomplishes all conditions)
    flash[:success] = "Welcome to the Alpha Blog, #{@user.username}!"
    redirect_to articles_path
    else     #if no, we render the new template and display the errors
      render "new"
    end
  end

private

def user_params

params.require(:user).permit(:username, :email, :password)

end
end
