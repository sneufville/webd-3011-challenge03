require_relative 'ar.rb'

10.times do |cat_index|
  # create a new category and persist to the DB
  category = Category.new(
    name: Faker::Commerce.color,
    description: Faker::Lorem.sentence(word_count = 12)
  )
  if category.save
    puts "#{cat_index + 1}: Created Category with details: #{category.inspect}"
    # create 10 products per category
    10.times do |p_index|
      product = Product.new(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence(word_count = 10),
        price: Faker::Commerce.price(range = 0..45.0),
        stock_quantity: Faker::Number.between(from=5, to=1337)
      )
      product.category = category
      if product.save
        puts "#{p_index + 1}: Created Product: #{product.inspect}"
      end
    end
  end
end
