#created a method that takes an array of hashes as a parameter
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


#created a method that takes 2 arrays of hashes
  def apply_coupons(cart, coupons)
#iterate over the coupons array
    coupons.each do |coupon|
#conditional: if any of the keys of items in the cart array == item in the coupon array
      if cart.keys.any? coupon[:item]
#secondary-conditional: if the cart/coupon :count value is greater than or equal to the coupon :num value
        if cart[coupon[:item]][:count] >= coupon[:num]
#then create a variable within the cart array for the discounted product which is == :item within the coupons array
          discounted_product = "#{coupon[:item]} W/COUPON"
#tertiary condiitonal: if there is a discounted product within the cart array
          if cart[discounted_product]
#then the :count value of the discounted product is added from the coupon :num value
            cart[discounted_product][:count] += coupon[:num]
          else
#otherwise, the discounted product's values within the cart array are == to the following
            cart[discounted_product] = {
            #count: is == the corresponding coupon's :num value
              count: coupon[:num],
            #price: is == the corresponding coupon's :cost value divided by the coupon's :num value
              price: coupon[:cost]/coupon[:num],
            #clearance: is added from the cart array's item value :clearance
              clearance: cart[coupon[:item]][:clearance]
            }
          end
#Finally, if coupon was applied to an item(s) reduce the item's :count value by the coupon's :num v
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
#return cart
    cart
end

#create a method that takes in an array of items
def apply_clearance(cart)
#create a variable == to cart
  my_cart = cart
#iterate over the new cart array
  my_cart.each do |key,value|
#conditional: if an item within the new cart of arrays has a :clearance value
    if my_cart[key][:clearance]
#update the item's price by multiplying by .8 then rounding the decimal to the second spot
      my_cart[key][:price] = (my_cart[key][:price] * 0.8).round(2)
    end
  end
#return cart
  my_cart
end


def checkout(cart, coupons)
    my_cart = consolidated_cart(cart)
      cart_with_coupons_applied = apply_coupons(my_cart, coupons)
        cart_with_discounts_applied = apply_clearance(cart_with_coupons_applied)

        total = 0.0
        
        cart_with_discounts_applied.keys.do |item|
      total += cart_with_discounts_applied[item][:price] * cart_with_discounts_applied[item][:count]
    end
    if total > 100
      total = total * 0.9
  end
  total    
end
