class Book < ApplicationRecord
has_one_attached :user
belongs_to :user

validates :title, presence: true, length: { maximum: 50 }

validates :body, presence: true



end