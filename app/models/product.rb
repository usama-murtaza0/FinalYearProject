class Product < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :category
    has_many :line_items
    
    mount_uploaders :pictures, AvatarUploader
end
