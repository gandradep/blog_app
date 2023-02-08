require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before do
    @user1 = User.create(
      name: 'Lilly',
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
    @post2 = Post.create(
      author: @user1,
      title: 'Post2',
      text: 'Somet text for post2',
      commentsCounter: 0,
      likesCounter: 0
    )
    @post3 = Post.create(
      author: @user1,
      title: 'Post3',
      text: 'Somet text for post3',
      commentsCounter: 0,
      likesCounter: 0
    )
    @post4 = Post.create(
      author: @user1,
      title: 'Post4',
      text: 'Somet text for post4',
      commentsCounter: 0,
      likesCounter: 0
    )
    visit user_path(@user1.id)
  end

  it 'shows the username' do
    expect(page).to have_content('Lilly')
    expect(page).not_to have_content('Jessica')
  end

  it 'shows profile pic' do
    expect(page).to have_css("img[src='https://unsplash.com/photos/k-1Q0eBFo_0']")
  end

  it 'shows the number of posts' do
    expect(page).to have_content("Number of posts: #{@user1.postsCounter}")
  end

  it 'shows user bio' do
    expect(page).to have_content @user1.bio
  end

  it 'shows last three posts' do
    expect(page).to have_content('Post4')
    expect(page).to have_content('Post3')
    expect(page).to have_content('Post2')
    expect(page).not_to have_content('Post1')
  end

  it 'shows button to see all posts' do
    expect(page).to have_css('a.button', text: 'See all posts')
  end

  it 'Redirecting to user/:id/posts/:id' do
    click_on @post2.title
    expect(page).to have_current_path user_post_path(@user1, @post2)
  end

  it 'Redirecting to user/:id/posts' do
    click_on 'See all posts'
    expect(page).to have_current_path user_posts_path(@user1.id)
  end
end
