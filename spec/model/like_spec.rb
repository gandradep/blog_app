require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'update post likesCounter' do
    author = User.create(name: 'Tom', postsCounter: 0)
    post = Post.create(author:, title: 'Post 1', commentsCounter: 0, likesCounter: 0)
    Like.create(author:, post:)
    expect(post.likesCounter).to eq(1)
  end
end
