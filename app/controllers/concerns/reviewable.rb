module Reviewable
    def eligible_for_review?(product_id)
        product_ids = LineItem.where(order_id: current_user.orders.pluck(:id)).pluck(:product_id)
        product_ids.include?(product_id.to_i)
    end
end