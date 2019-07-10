#created a method that takes an array as a parameter 
def consolidate_cart(cart)
  #create an empty hash for the updated cart
  my_cart = {}
#iterate over the cart to create the new hash
  cart.each do |hash|
#create a keys variable == to the cart's item names(keys)
    keys = hash.keys
#iterate over the keys
      keys.each do |k|
#create a variable for the values of each key
      v = hash[k]
#create a variable == the item
      my_cart_item_value = my_cart[k]
#conditional, if the item == nil
        if my_cart_item_value.nil?
#then add a value of 1 to a new value called :count
          v[:count] = 1
#sets the item in the updated cart == to the value
          my_cart[k] = v
        else
#if there is an item already in the cart, increment the :count value by 1
          v[:count] = my_cart_item_value[:count] + 1
#sets the item in the updated cart == to the value
          my_cart[k] = v
        end
#output "items: values"
        puts "#{k}: #{my_cart[k]}"
      end
    end
#return cart
    my_cart
  end

  def apply_coupons(cart, coupons)
    coupons.each do |coupon|
      if cart.keys.any? coupon[:item]
        if cart[coupon[:item]][:count] >= coupon[:num]
          discounted_product = "#{coupon[:item]} W/COUPON"
          if cart[discounted_product]
            cart[discounted_product][:count] += coupon[:num]
          else
            cart[discounted_product] = {
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
