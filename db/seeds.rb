# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
User.destroy_all
Category.destroy_all
Droid.destroy_all

puts "Creating user..."
antho = { name: "Antho", email: "antho@robot.com", password: '123456' }
gooch =  { name: "Gooch", email: "gooch@robot.com", password: '123456' }
lea =  { name: "Lea", email: "lea@robot.com", password: '123456' }
jeanphi =  { name: "Jeanphi", email: "jeanphi@robot.com", password: '123456' }

[ antho, gooch, lea, jeanphi ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"
end

puts "Creating Robots..."
r2d2 = { name: 'R2D2', address: 'Tatooine', description: 'hacking robot', price: '89' }
atom = { name: 'Atom', address: 'Texas', description: 'UFC robot', price: '51' }
bumblbee = { name: 'Bumblebee', address: 'Space', description: 'Funky', price: '49' }
daftpunk = { name: 'Daft Punk', address: 'France', description: 'Electro', price: '25' }

[ r2d2, atom, bumblbee, daftpunk ].each do |attributes|
    droid = Droid.new(attributes)
    droid.user = User.all.sample
    droid.save
    puts "Created #{droid.name}"
  end

puts "Creating Categories..."
protocol = { name: 'protocol'}
combat = { name: 'combat'}
spy = { name: 'spy'}
healer = { name: 'healer'}

[ protocol, combat, spy, healer ].each do |attributes|
    category = Category.create!(attributes)
    puts "Created #{category.name}"
  end

puts "Finished!"