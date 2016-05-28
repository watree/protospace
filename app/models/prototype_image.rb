class PrototypeImage < ActiveRecord::Base
  mount_uploader :image, PrototypeImageUploader
  belongs_to :prototype
  enum type: %i(main sub)
  validates :image, :type, presence: true
end
