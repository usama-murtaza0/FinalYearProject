module Reviewable
    def eligible_for_review?(productId)
        reviews = Review.all.where(user_id: current_user.id).where(product_id: productId)
        if reviews.present?
            return false
        else
            product_ids = LineItem.where(order_id: current_user.orders.pluck(:id)).pluck(:product_id)
            product_ids.include?(productId.to_i)
        end
    end
end