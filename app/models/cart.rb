class Cart < ApplicationRecord
  has_many :line_items
  has_many :products, through: :line_items
  belongs_to :user

  def sub_total
    sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.total_price
    end
    return sum
  end
end


# Order.joins(:line_items).where("orders.id = line_items.order_id and line_items.product_id in (?) ", vendor_product_ids)
# vendor_product_ids = Product.where(user_id: 5).pluck(:id)