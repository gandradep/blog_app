require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tester', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postsCounter: 2) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'post counter not negative' do
    subject.postsCounter = -10
    expect(subject).to_not be_valid
  end

  it 'post counter is an integer' do
    subject.postsCounter = 'mama'
    expect(subject).to_not be_valid
  end

  it 'Recent posts shows 3' do
    Post.create(author_id: subject.id, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
    Post.create(author_id: subject.id, title: 'Hello2', text: 'This is my first post2', commentsCounter: 0, likesCounter: 0)
    Post.create(author_id: subject.id, title: 'Hello3', text: 'This is my first post3', commentsCounter: 0, likesCounter: 0)
    Post.create(author_id: subject.id, title: 'Hello4', text: 'This is my first post4', commentsCounter: 0, likesCounter: 0)
    expect(subject.recent_posts.count).to eq 3
  end
end
