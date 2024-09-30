class AddImageToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :image, :string
  end
end
