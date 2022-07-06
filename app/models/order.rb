class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :user
    
    enum delivery_status: {
        recieved: 0,
        shipped: 1,
        on_way: 2,
        delivered: 3
    }
end
