class ChangeColumnNullOnPostsGenreId < ActiveRecord::Migration[7.2]
  def change
    change_column_null :posts, :genre_id, true
  end
end
