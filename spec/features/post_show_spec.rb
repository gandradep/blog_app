require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before do
    @user1 = User.create(
      name: 'Lilly',
      postsCounter: 0,
      photo: 'https://unsplash.com/photos/k-1Q0eBFo_0',
      bio: 'Testing bio'
    )
    @user2 = User.create(
      name: 'Pepe',
      postsCounter: 0,
      photo: 'https://unsplash.com/photos/k-1Q0eBFo_0',
      bio: 'Testing bio'
    )
    @post1 = Post.create(
      author: @user1,
      title: 'Post1',
      text: 'Somet text for post1',
      commentsCounter: 0,
      likesCounter: 0
    )
    @comment1 = Comment.create(
      author: @user1,
      post: @post1,
      text: 'Comment1 post1'
    )
    @comment2 = Comment.create(
      author: @user2,
      post: @post1,
      text: 'Comment2 post1'
    )
    visit user_post_path(@user1, @post1)
  end

  it 'See post title' do
    expect(page).to have_content @post1.title
  end

  it 'shows who wrote the post' do
    expect(page).to have_content "by #{@user1.name}"
  end

  it 'should show how many comments a post has ' do
    expect(page).to have_content "Comments: #{@post1.commentsCounter}"
  end

  it 'should show how many likes a post has ' do
    expect(page).to have_content "Likes: #{@post1.likesCounter}"
  end

  it 'See post body' do
    expect(page).to have_content @post1.text
  end

  it 'See who wrote the comment' do
    expect(page).to have_content @comment1.author.name
    expect(page).to have_content @comment2.author.name
  end

  it 'See the comment left' do
    expect(page).to have_content @comment1.text
    expect(page).to have_content @comment2.text
  end
end
