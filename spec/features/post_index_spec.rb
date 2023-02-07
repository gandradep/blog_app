require 'rails_helper'

RSpec.describe 'User index', type: :feature do
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
    @comment1 = Comment.create(
      author: @user1,
      post: @post1,
      text: 'Comment1 post1'
    )
    visit user_posts_path(@user1)
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

  it 'See post titles' do
    expect(page).to have_content @post1.title
    expect(page).to have_content @post2.title
  end

  it 'See post body' do
    expect(page).to have_content @post1.text
    expect(page).to have_content @post2.text
  end

  it 'should show comments' do
    expect(page).to have_content @comment1.text
  end

  it 'should show how many comments a post has ' do
    expect(page).to have_content "Comments: #{@post1.commentsCounter}"
  end

  it 'should show how many likes a post has ' do
    expect(page).to have_content "Likes: #{@post1.likesCounter}"
  end

  it 'should not show a pagination button' do
    expect(page).not_to have_content('Pagination')
  end

  it 'Redirecting to user/:id/posts/:id' do
    click_on @post2.title
    expect(page).to have_current_path user_post_path(@user1, @post2)
  end
end
