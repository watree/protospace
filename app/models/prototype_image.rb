class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  emun type: %i(main sub)
  validates :image, :type, presence: true
end
