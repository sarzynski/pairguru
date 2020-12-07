require "rails_helper"

describe "Genres requests", type: :request do
  let!(:movie) { create(:movie) }
  let!(:comment) { create(:comment, movie_id: movie.id)}

  describe "genre list" do
    it "displays only related movies" do
      visit "/movies/#{movie.id}"
      expect(page).to have_content("commented")
    end
  end
end
