require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postsCounter: 0)
  subject do
    Post.new(author_id: author.id, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
  end
  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'title lenght not more than 250 character' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'likes counter not negative' do
    subject.likesCounter = -10
    expect(subject).to_not be_valid
  end

  it 'comments counter not negative' do
    subject.commentsCounter = -10
    expect(subject).to_not be_valid
  end

  it 'likes counter is an integer' do
    subject.likesCounter = 'mama'
    expect(subject).to_not be_valid
  end

  it 'comments counter is an integer' do
    subject.commentsCounter = 'mama'
    expect(subject).to_not be_valid
  end

  it 'Recent comments shows 5' do
    5.times { Comment.create(post_id: subject.id, author_id: author.id, text: 'Hi Tom!') }
    expect(subject.recent_five_comments.count).to eq 5
  end

  it 'update author posts count automatically after save' do
    man = User.create(name: 'Tom', postsCounter: 0)
    Post.create(author: man, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)
    expect(man.postsCounter).to eq 1
  end
end
