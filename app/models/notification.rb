class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiale, polymorphic: true
end
