class PrototypeImage < ActiveRecord::Base
  mount_uploader :image, PrototypeImageUploader
  belongs_to :prototype
  enum type: %i(main sub)
  self.inheritance_column = :_type_disabled

end
