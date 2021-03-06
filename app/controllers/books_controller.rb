class BooksController < ApplicationController



 def create
     @book = Book.new(books_params)
  @book.user_id = current_user.id
   @books = Book.all
   if @book.save
    redirect_to "/books/#{@book.id}"
    flash[:notice] = "have created book successfully."
  else
    render :index
  end
end

  def index
 @books = Book.all
 @book = Book.new

 end

  def show
  @book = Book.find(params[:id])
  @books = Book.new
  @user = @book.user

end

def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end

end

def update
     @book = Book.find(params[:id])
   if @book.update(books_params)
    redirect_to "/books/#{@book.id}"
     flash[:notice] = "have updated book successfully."
  else
    render :edit
  end
end

     def destroy
    @book = Book.find(params[:id])
   if @book.destroy
    redirect_to books_path
  end
 end
end

private
  
  def books_params
    params.require(:book).permit(:title,:body)
  end
