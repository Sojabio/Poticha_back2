class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.includes(:author)
    render json: @books.as_json(include: {
      author: {
        only: [:id, :first_name, :last_name]
      }
    })
  end

  # GET /books/1
  def show
    @book = Book.includes(:author).find(params[:id])
    render json: @book.as_json(include: {
      author: {
        only: [:id, :first_name, :last_name]
      }
    })
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: { success: false, errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: { success: false, errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :ISBN, :pages, :season, :author_id, :issue_date)
    end
end
