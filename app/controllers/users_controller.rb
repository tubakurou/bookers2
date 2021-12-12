class UsersController < ApplicationController

def show

  @books = Book.all
  @user = User.find(params[:id])
 @users = User.all
 end

def create
    book = book.new
if  user.create(User_params)

    redirect_to "/books"
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
