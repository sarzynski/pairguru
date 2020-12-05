require "rails_helper"

describe Movie do
  it { is_expected.to have_many(:comments) }
end
