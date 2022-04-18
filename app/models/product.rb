class Product < ApplicationRecord
    mount_uploader :picture, AvatarUploader
end
