module Reviewable
    def eligible_for_review?(product_id)
        product_ids = LineItem.where(order_id: current_user.orders.pluck(:id)).pluck(:product_id)
        reviews = Review.all.where(user_id: current_user.id)
        if reviews.present?
            return false
        else
            product_ids.include?(product_id.to_i)
        end
    end
end