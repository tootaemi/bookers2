class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :user
  validates :title, presence: true
  validates :body,  length: {maximum: 200}, presence: true
end