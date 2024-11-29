class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :impression, presence: true, length: {maximum: 50}
  validates :star, presence: true

  has_one_attched :image

  def get_image(width, height)
   unless image.attched?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [ width, height ]).processed
  end
end
