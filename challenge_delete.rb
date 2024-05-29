require_relative 'ar.rb'

# find the product
pineapple_upside_down = Product.where(:name => "Pineapple Upside down Cake").first
puts pineapple_upside_down.inspect
pineapple_upside_down.destroy unless pineapple_upside_down.nil?
