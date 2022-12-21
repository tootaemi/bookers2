class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :book
has_one_attached :profile_image

has_many :books, dependent: :destroy


#validates :name, length: {minimum: 2, maximum: 4}
validates :name, uniqueness: true, inclusion: { in: 2..20 }



def get_profile_images
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image
end
end
