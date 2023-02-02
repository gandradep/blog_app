class PostsController < ApplicationController
  layout 'standard'
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show; end
end
