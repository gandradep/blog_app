class Api::PostsController < Api::ApplicationController
  def index
    user = User.find(params[:user_id])
    posts = user.posts
    render json: posts, status: :ok
  end

  def show
    post = Post.find(params[:id])
    render json: post, status: :ok
  end
end
