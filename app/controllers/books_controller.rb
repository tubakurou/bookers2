class BooksController < ApplicationController
  before_action :authenticate_user!

 def create
     @book = Book.new(book_params)
  @book.user_id = current_user.id
    
   if @book.save
    redirect_to books_path(current_user.id)
  else
    render :index
  end
end

  def index

@books = Book.all
  @user = current_user
 

 end

  def show
  @user = User.find(params[:id])

end


  def destroy
  end

private
  def book_params
    params.permit(:title,:body,:user)
  end
end