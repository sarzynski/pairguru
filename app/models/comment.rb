class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :movie_id, uniqueness: { scope: :user_id, message: "You can leave only one comment to the movie" }
  validates :content, :presence => {:message => "The comment can't be empty" }
end
