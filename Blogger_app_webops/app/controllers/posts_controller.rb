class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /posts
  #

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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.user_id == current_user.id
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
    else
      render json: {
        message: "You are not the owner"
      }, status: :ok
    end
  end

  # DELETE /posts/1
  def destroy
    Comment.where(post_id: params[:post_id].to_i).destroy_all
    if @post.user_id == current_user.id
    @post.destroy!
    else
    render json: {
      message: "You are not the owner"
    }, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:title, :body, :user_id, tags: [])
    end
end
