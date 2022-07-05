class LineItem < ApplicationRecord  
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    if self.product.sale
      self.quantity * self.product.sale_price
    else
      self.quantity * self.product.price
    end
  end
end