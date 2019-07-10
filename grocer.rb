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

  
