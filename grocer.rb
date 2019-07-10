def consolidate_cart(cart)
  my_cart = {}

  cart.each do |hash|
    keys = hash.keys
      keys.each do |k|
      v = hash[k]
      my_cart_item_value = my_cart[k]
        if my_cart_item_value.nil?
          v[:count] = 1
          my_cart[k] = v
        else
          v[:count] = my_cart_item_value[:count] + 1
          my_cart[k] = v
        end
        puts "#{k}: #{my_cart[k]}"
      end
    end
    my_cart
  end

  def apply_coupons(cart, coupons)
    coupons.each do |coupon|
      if cart.keys.any? coupon[:item]
        if cart[coupon[:item]][:count] >= coupon[:num]
          new_name = "#{coupon[:item]} W/COUPON"
          if cart[new_name]
            cart[new_name][:count] += coupon[:num]
          else
            cart[new_name] = {
              count: coupon[:num],
              price: coupon[:cost]/coupon[:num],
              clearance: cart[coupon[:item]][:clearance]
            }
          end
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
    cart
  end
