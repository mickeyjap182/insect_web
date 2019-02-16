# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create nickname: "daddy", email: "daddy@nono.example", birthday:"1983/01/01", password:"password1", password_confirmation:"password1", status:10
user_2 = User.create nickname:"mom", email:"mom@nono.example", birthday:"1984/02/02", password:"password2", password_confirmation:"password2", status:10
sensor_1 = Sensor.create(
  user_id: user_1.id,
  name: "DHT22",
  status: 10,
  explanation: "-20 - 80度まで計測可能。",
  type_cd: 1
)
th_1 = TempHumidity.create(
  sensor_id: sensor_1.id,
  temp: 15.2,
  humidity: 67.8,
  inspected_at: '2018/12/11 13:45:45',
)
