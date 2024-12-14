class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :comment, presence: true, length: {maximum: 30}

  after_create do 
    notifications.create(user_id: post.user_id)
  end  
end
