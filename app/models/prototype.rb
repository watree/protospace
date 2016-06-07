class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images, dependent: :delete_all
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :prototype_images
  validates :catch_copy, :concept, :title, presence: true
end
