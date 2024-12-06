class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :tag_items, dependent: :destroy
  has_many :vod_items, dependent: :destroy
  has_many :vods, through: :vod_items

  validates :title, presence: true
  validates :impression, presence: true, length: {maximum: 50}

  has_one_attached :image

  def get_image(width, height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [ width, height ]).processed
  end

  def self.search_for(word,condition)
    if condition=="partial"
      Post.where("name LIKE?", "%"+word+"%")
    elsif condition=="forward"
      Post.where("name LIKE?", word+"%")
    elsif condition=="backward"
      Post.where("name LIKE?","%"+word) 
    elsif condition=="perfect"
      Post.where(name: word)     
    end 
  end 
end
