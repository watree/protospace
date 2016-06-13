class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images, dependent: :delete_all
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :prototype_images
  validates :catch_copy, :concept, :title, presence: true

  def post_like?(user)
    likes.find_by(user_id: user.id)
  end
end
