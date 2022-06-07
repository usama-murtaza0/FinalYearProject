class LineItem < ApplicationRecord  
  belongs_to :product
  belongs_to :cart

  def total_price
    if self.product.sale
      self.quantity * (self.product.price - (self.product.price*self.product.sale/100))
    else
      self.quantity * self.product.price
    end
  end
end