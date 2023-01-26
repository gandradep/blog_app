class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_author_post_counter

  def update_author_post_counter
    author.update(postsCounter: author.posts.count)
  end

  def recent_five_posts
    comments.order(created_at: :desc).limit(5)
  end
end
