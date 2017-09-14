# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  fuck_id    :integer          not null
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :fuck

  belongs_to :parent,
    optional: true,
    foreign_key: :parent_id,
    class_name: :Comment

  has_many :children,
    foreign_key: :parent_id,
    class_name: :Comment
end
