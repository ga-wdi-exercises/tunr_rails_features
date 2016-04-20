class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy

  validates :name, :photo_url, :nationality, presence: true
end
