class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_likes_counter
    post.update(likesCounter: post.likes.count)
  end
end
