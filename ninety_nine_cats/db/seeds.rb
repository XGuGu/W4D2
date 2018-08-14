# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

cat1 = Cat.create!(birth_date: '1993-01-06', color: "brown", name: "Ryan", sex: "M", description: "great cat!")
cat2 = Cat.create!(birth_date: '1993-01-29', color: "yellow", name: "Andy", sex: "M", description: "awesome cat!")
cat3 = Cat.create!(birth_date: '1993-05-02', color: "purple", name: "Jennifer", sex: "F", description: "great cat!")
cat4 = Cat.create!(birth_date: '1993-03-05', color: "white", name: "Mashu", sex: "M", description: "great cat!")
cat5 = Cat.create!(birth_date: '1993-08-01', color: "orange", name: "Pete", sex: "M", description: "great cat!")

CatRentalRequest.destroy_all
rental_request1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2018-06-07', end_date: '2018-06-17', status: 'APPROVED')
rental_request2 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2018-07-07', end_date: '2018-07-17', status: 'DENIED')
rental_request3 = CatRentalRequest.create!(cat_id: cat3.id, start_date: '2018-08-07', end_date: '2018-08-17', status: 'PENDING')
