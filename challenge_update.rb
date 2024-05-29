require_relative 'ar.rb'

products_stock_40 = Product.where(["stock_quantity > ?", 40])
# safe way to update
products_stock_40.each do |prod|
  prod.stock_quantity += 1
  prod.save
end
