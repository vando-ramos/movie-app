class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre

  validates :title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :genre_id, presence: true
end
