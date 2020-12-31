# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Jennifer Beaver' }, { name: 'Taher Ali' }])

recordings = Recording.create([{ title: 'NewRecordingForJenniferBeaver', melody: 'LaLa.wav/link', user_id: 1 },
{ title: 'NewRecordingForTaherAli', melody: 'DoDo.wav/link', user_id: 2 } ])
