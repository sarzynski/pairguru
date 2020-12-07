require "rails_helper"

describe "Genres requests", type: :request do
  let!(:movie) { create(:movie) }
  let!(:comment) { create(:comment, movie_id: movie.id)}

  describe "comments list" do
    it "displays comment" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content("commented")
    end
  end
end
