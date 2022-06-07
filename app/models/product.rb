class Product < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :category
    
    mount_uploaders :pictures, AvatarUploader
end
