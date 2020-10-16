# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
class Comment < ApplicationRecord
  belongs_to :board
  validates :description, presence: true
end
