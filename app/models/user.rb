class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [ width, height ]).processed
  end
       
  GUEST_USER_EMAIL="guest@sample.com"
       
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
     user.password=SecureRandom.urlsafe_base64
     user.name="guest_uesr"
    end
  end
       
  def guest_user?
    email==GUEST_USER_EMAIL
  end

  def self.search_for(word,condition)
    if condition=="partial"
      User.where("name LIKE?", "%"+word+"%")
    elsif condition=="forward"  
      User.where("name LIKE?", word+"%")
    elsif condition=="backward"  
      User.where("name LIKE?", "%"+word)
    elsif condition=="perfect"
      User.where(name: word)  
    end
  end 
end
