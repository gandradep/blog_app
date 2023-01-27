require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'update post commentsCounter' do
    author = User.create(name: 'Tom', postsCounter: 0)
    post = Post.create(author:, title: 'Post 1', commentsCounter: 0, likesCounter: 0)
    Comment.create(author:, post:)
    expect(post.commentsCounter).to eq(1)
  end
end
