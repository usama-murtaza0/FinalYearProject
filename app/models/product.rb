class Product < ApplicationRecord
    belongs_to :user
    has_many :reviews
    
    mount_uploader :picture, AvatarUploader
end
