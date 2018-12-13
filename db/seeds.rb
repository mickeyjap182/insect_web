# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create nickname: "daddy", email: "daddy@nono.example", birthday:"1983/01/01", password:"password1", status:10, cls:10
User.create nickname:"mom", email:"mom@nono.example", birthday:"1984/02/02", password:"password2", status:10, cls:10
