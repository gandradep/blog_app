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
      postsCounter: 2,
      photo: 'https://unsplash.com/photos/nMuIXO5EEpM',
      bio: 'Testing bio PEPe'
    )
    visit root_path
  end

  it 'shows the username' do
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 2')
  end

  it 'shows profile pic' do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/']")
  end

  it 'shows the username' do
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Pepe')
  end

  it 'Redirecting to user/:id' do
    click_on @user1.name
    expect(page).to have_current_path user_path(@user1.id)
  end
end
