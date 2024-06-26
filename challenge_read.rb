require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Read any product from the database
product = Product.first
puts product.inspect
# fields in the products table (Product model)
# name (string), description (string), price (big decimal), stock_quantity (int), category_id (int), created_at (timestamp), updated_at (timestamp)
# the field category_id relates to the categories table (Category model)

# Print the names of all products above $10 with names that begin with the letter C.
products_over_10 = Product.where(["name like ? and price > ?", "C%", 10])
puts "Printing products whose names begin with the letter C and have a price above $10..."
products_over_10.each { |product_found|
  puts product_found.name
}

number_of_products_low_stock = Product.where("stock_quantity < '5'").count
puts "Number of products with low_stock: #{number_of_products_low_stock}"

puts product.category.name

first_category = Category.first
new_product_from_cat = first_category.products.build(
    name: 'Amazing Product',
    description: 'This is the most amazing product',
    price: 4.04,
    stock_quantity: 404,
)

new_product_from_cat.save
puts new_product_from_cat.inspect

last_category = Category.last
# related products
related_products = last_category.products.where("price > '10'")
related_products.each do |related|
  puts "Product: #{related.name} $#{related.price}"
end
