# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  validates :description, presence: true
  validates :description, length: {minimum: 5 }

  belongs_to :user
end
