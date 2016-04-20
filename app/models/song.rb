class Song < ActiveRecord::Base
  belongs_to :artist

  validates :title, :album, :preview_url, :artist_id, presence: true
end
