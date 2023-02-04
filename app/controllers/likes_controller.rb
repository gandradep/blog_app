class LikesController < ApplicationController
  layout 'standard'
  def create
    @like = Like.new(params.require(:like).permit(:post_id))
    @like.author = current_user
    if @like.save
      flash[:success] = 'Post liked succefully!'
      redirect_to user_post_url(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Try liking again!'
    end
  end
end
