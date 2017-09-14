class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :title, uniqueness: { scope: :band_id }
  validates :live, inclusion: { in: [true, false] }

  after_initialize :set_defaults

  belongs_to :band

  def set_defaults
    self.live ||= false
  end
end
