# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  has_many :comments,
  foreign_key: :artwork_id,
  class_name: :Comment,
  dependent: :destroy

  def self.artwork_for_user_id(user_id)
    artworks = []
    artworks += Artwork.where(artist_id: user_id)
    artworks += User.find(user_id).shared_artworks
    artworks
  end
end
