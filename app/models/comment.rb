class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_comment_counter
    post.update(commentsCounter: post.comments.count)
  end
end
