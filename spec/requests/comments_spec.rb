require "rails_helper"

describe "Comments requests", type: :request do
  let!(:movie) { create(:movie) }
  let!(:comment) { create(:comment, content: "Sample comment", movie_id: movie.id)}

  describe "comments list" do
    it "displays comment" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content("Sample comment")
    end
  end
end
