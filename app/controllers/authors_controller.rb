class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  def create
    if params[:image].present?
      image = Cloudinary::Uploader.upload(params[:image])
      @author = Author.new(image: image['url'])
    else
      @author = Author.new
    end

    @author.first_name = params[:author][:first_name]
    @author.last_name = params[:author][:last_name]
    @author.biography = params[:author][:biography]
    @author.email = params[:author][:email]

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: { success: false, errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if params[:image].present?
      image = Cloudinary::Uploader.upload(params[:image])
      @author.update(image: image['url'])
    end

    if @author.update(author_params)
      render json: @author
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :email, :biography, :image)
    end
end
