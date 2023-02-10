class PostsController < ApplicationController
  layout 'standard'
  # load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.required(:post).permit(:title, :text))
    post.author = current_user
    post.likesCounter = 0
    post.commentsCounter = 0
    if post.save
      flash[:success] = 'Post saved'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Post not created!!'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(params[:user_id])
    post.destroy
    user.update(postsCounter: user.posts.count)
    redirect_to user_posts_path(user.id)
  end
end
