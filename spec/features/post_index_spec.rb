require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before do
    @user1 = User.create(
      name: 'Lilly',
      postsCounter: 0,
      photo: 'https://unsplash.com/photos/k-1Q0eBFo_0',
      bio: 'Testing bio'
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

end
