class Api::CommentsController < Api::ApplicationController
  def index
    post = Post.find(params[:post_id])
    render json: post.comments, status: :ok
  end

  def create
    p params
    comment = Comment.new(author_id: params[:user_id], post_id: params[:post_id], text: params[:text])

    if comment.save
      render json: 'Comment created'
    else
      render json: 'Comment failed being created'
    end
  end
end
