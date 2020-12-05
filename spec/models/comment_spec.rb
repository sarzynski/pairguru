require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new }
  let(:movie) {create(:movie)}
  let(:user) {create(:user)}

  it { should belong_to(:movie) }
  it { should belong_to(:user) }

  it "is valid with valid attributes" do
    subject.content = "Sample content"
    subject.movie_id = movie.id
    subject.user_id = user.id
    expect(subject).to be_valid
  end

  it "is not valid with empty content" do
    subject.content = ""
    subject.movie_id = movie.id
    subject.user_id = user.id
    expect(subject).to_not be_valid
  end

  it "is not valid with nil content" do
    subject.content = nil
    subject.movie_id = movie.id
    subject.user_id = user.id
    expect(subject).to_not be_valid
  end
end
