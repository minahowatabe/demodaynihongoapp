class Lab < ApplicationRecord
  mount_uploaders :image, ImageUploader    
  default_scope -> { order(created_at: :desc) }
end
