class Course < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  mount_uploader :image, ImageUploader
end
