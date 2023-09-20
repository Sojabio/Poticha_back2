class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    if params[:image].present?
      image = Cloudinary::Uploader.upload(params[:image])
      @post = Post.new(image: image['url'])
    else
      @post = Post.new
    end

    @post.title = params[:post][:title]
    @post.content = params[:post][:content]

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: { success: false, errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if params[:image].present?
      image = Cloudinary::Uploader.upload(params[:image])
      @post.update(image: image['url'])
    end

    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end



  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
