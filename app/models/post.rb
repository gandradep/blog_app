class Post < ApplicationRecord
  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # associations
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
