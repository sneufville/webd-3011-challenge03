require_relative 'ar.rb'

# create products
# Create three new products using the three different ways to create new AR objects.

# create a product by manually setting the properties and then saving
product_0 = Product.new

product_0.name = 'Pineapple Upside down Cake'
product_0.description = 'A cake with a base of pineapples and flipped upside down after baking'
product_0.price = 10.01
product_0.stock_quantity = 13
product_0.category_id = 3

if product_0.save
  puts "Product: Pineapple Upside Down Cake was saved"
else
  puts "Could not save the Pineapple Upside Down Cake :("
end

# create a product using new constructor and then calling save
product_1 = Product.new(
  name: 'Plantain Tart',
  description: 'A delicious pastry filled with plantain and baked to perfection',
  price: 4.50,
  stock_quantity: 100,
  category_id: 3
)

if product_1.save
  puts "Product: Plantain Tart was saved"
else
  puts "Failed to save plantain tart :("
end

puts product_1

product_2 = Product.create(
  name: 'Red Velvet Cake',
  description: 'The best cake you\'ve ever had in your entire life',
  price: 13.37,
  stock_quantity: 1337,
  category_id: 3
)

# Product with missing details
bad_product = Product.new(
  name: 'Bad Product',
  category_id: 3,
)

if bad_product.save
  puts "Bad product was saved"
else
  bad_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}"
    end
  end
end
