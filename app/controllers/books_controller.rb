class BooksController < ApplicationController

  before_action :set_book, only: %i[show edit]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @statuses = Book.statuses.keys.to_a
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: "El libro ha sido creado"}
      else
        format.html  {render :new}
      end
    end
  end

  def edit
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :author, :status, :lend_date, :return_date)
  end

end
