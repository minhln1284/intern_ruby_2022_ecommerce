require 'faker'

men = Category.create!(name: "Men")
woman = Category.create!(name: "Woman")
3.times do
  name = Faker::Emotion.noun
  cate1 = men.categories.new(name: name)
  cate1.save!
  name = Faker::Emotion.noun
  cate1.categories.create!(name: name)

  name = Faker::Movie.title
  cate2 = woman.categories.new(name: name)
  cate2.save!
  name = Faker::Movie.title
  cate2.categories.create!(name: name)
end

categories = Category.all
n = 0
categories.each do |category|
  5.times do
    name = "product-#{n}"
    des = Faker::Lorem.sentence(word_count: 5)
    product = category.products.create!(name: name, price: 50, quantity_in_stock: 5, description: des)
    product_image = product.product_images.create!
    product_image.image.attach(io: File.open("app/assets/images/ProductImage/product#{rand(1..5)}.jpg"), filename: "product#{rand(1..35)}.jpg")
    n += 1
  end
end
