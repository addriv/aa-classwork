# == Schema Information
#
# Table name: fuck_list_categories
#
#  id           :integer          not null, primary key
#  fuck_id      :integer          not null
#  fuck_list_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FuckListCategory < ApplicationRecord
  belongs_to :fuck
  belongs_to :fuck_list
end
