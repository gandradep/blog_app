class CommentsController < ApplicationController
  layout 'standard'
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = post
    if @comment.save
      flash[:success] = 'Comment created succesfully!'
      redirect_to user_post_url(user, post)
    else
      flash[:error] = "The comment couldn't be created!"
      render :new, status: :unprocessable_entity
    end
  end
end
