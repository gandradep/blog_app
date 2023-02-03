class PostsController < ApplicationController
  layout 'standard'
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
    p post
    if post.save
      flash[:success] = 'Post saved'
      redirect_to user_posts_url
    else
      flash[:error] = 'Post not created'
      render :new
    end

  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
