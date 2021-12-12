class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
   @books = @user.books
 end

def create
    @user = User.new
if  user.save(User_params)

    redirect_to users_path(user.id)
  else
    render :show
  end
end

def index
    @user = current_user
 @users = User.all

end

def edit

end

def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
    params.require(:book).permit(:title, :body)

  end
end
