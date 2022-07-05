class Product < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :category
    has_many :line_items
    
    mount_uploaders :pictures, AvatarUploader
    validates :price, presence: true
    
    def sale_price
        return price if sale.nil? || sale == 0
        price-(price*sale/100)
    end
end
