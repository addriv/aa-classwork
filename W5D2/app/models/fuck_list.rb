# == Schema Information
#
# Table name: fuck_lists
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FuckList < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  belongs_to :moderator,
    class_name: :User

  has_many :fuck_list_categories, inverse_of: :fuck_list, dependent: :destroy

  has_many :fucks,
    through: :fuck_list_categories
end
