require_relative 'ar.rb'

# all categories
all_categories = Category.all

# loop over all categories
all_categories.each do |category|
  puts "Category: #{category.name}"

  # retrieve the related products and then loop over
  related_products = Product.where(:category => category)
  related_products.each do |product|
    puts "\t* #{product.name} $#{product.price} (in stock: #{product.stock_quantity})"
  end
end
