class Comment < ApplicationRecord
  validates :text, presence: true, allow_blank: false, length: { maximum: 250 }
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_post_comment_counter

  def update_post_comment_counter
    post.update(commentsCounter: post.comments.count)
  end
end
