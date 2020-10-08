# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  has_one_attached :eyecatch

  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  validates :description, presence: true
  validates :description, length: {minimum: 5 }

  has_many :comments, dependent:  :destroy
  has_many :likes, dependent:  :destroy
  belongs_to :user

  def likes_count
    likes.count
  end

end
