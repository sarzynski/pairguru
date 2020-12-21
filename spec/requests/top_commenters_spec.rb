require "rails_helper"

describe "Top commenters requests", type: :request do
  let!(:movie) { create(:movie) }
  let!(:user) { create(:user, name: "Lorem") }
  let!(:comment) { create(:comment, content: "Sample comment", user_id: user.id, movie_id: movie.id)}

  describe "top commenters list" do
    it "displays right title" do
      visit "/top_commenters"
      expect(page).to have_selector("h1", text: "Top commenters of the week")
    end

    it "displays right user" do
      visit "/top_commenters"
      expect(page).to have_content("Lorem")
    end
  end
end
