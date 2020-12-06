require "rails_helper"

describe User do
  it { is_expected.to allow_value("+48 999 888 777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("aaa +48 aaa bbb ccc").for(:phone_number) }
  it { is_expected.not_to allow_value("+48 999 888 777\naseasd").for(:phone_number) }
  it { is_expected.to have_many(:comments) }

  it 'returns empty array if no comments' do
    expect(described_class.count_comments).to be_empty
  end

  it 'returns only top 10 commenters' do
    11.times do
      create(:comment)
    end
    top_commenters = described_class.count_comments.to_a
    expect(top_commenters.size).to eq(10)
  end
end
