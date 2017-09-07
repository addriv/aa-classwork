class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true

  def self.random_code(long_url, user)
    short = SecureRandom.urlsafe_base64

    while ShortenedUrl.all.any? { |data| data.short_url == short }
      short = SecureRandom.urlsafe_base64
    end

    ShortenedUrl.create!(long_url: long_url, short_url: short, user_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :denizens,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors, through: :denizens, source: :user

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.visitors.uniq.count
  end

  def num_recent_uniques
    self.denizens.distinct.select do |visit|
      visit.created_at >= 10.days.ago
    end.count
  end

end
