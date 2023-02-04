class CommentsController < ApplicationController
  layout 'standard'
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    @comment = Comment.new
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = post
    if @comment.save
      flash[:success] = 'Comment created succesfully!'
      p 'saved'
    else
      flash[:error] = "The comment couldn't be created!"
      p 'not save'
    end
    redirect_to user_post_url(user, post)
  end
end
