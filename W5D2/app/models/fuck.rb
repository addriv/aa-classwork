# == Schema Information
#
# Table name: fucks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  img_url    :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fuck < ApplicationRecord
  validates :name, presence: true

  belongs_to :author,
    class_name: :User

  has_many :fuck_list_categories, inverse_of: :fuck, dependent: :destroy

  has_many :fuck_lists,
    through: :fuck_list_categories

  has_many :comments
end
