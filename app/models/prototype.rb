class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images, dependent: :delete_all
  accepts_nested_attributes_for :prototype_images
  validates :catch_copy, :concept, :title, presence: true
end
