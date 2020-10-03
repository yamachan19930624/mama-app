# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Board < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  validates :description, presence: true
  validates :description, length: {minimum: 5 }
end
