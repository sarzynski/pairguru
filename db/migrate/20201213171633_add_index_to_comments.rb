class AddIndexToComments < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, [:movie_id, :user_id], unique: true
  end
end
