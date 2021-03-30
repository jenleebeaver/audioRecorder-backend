# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#delete_all is a public activerecord method that allows us to delete specified data 
#https://apidock.com/rails/ActiveRecord/Base/delete_all/class
User.destroy_all
Recording.destroy_all 

jennifer = User.create(name: "Jennifer Beaver")
taher = User.create(name: "Taher Ali")

Jennifer_Recording1 = Recording.create(title: "NewRecordingJenniferBeaver", user_id: jennifer.id)
Jennifer_Recording2 = Recording.create(title: "NewRecordingJenniferBeaver2", user_id: jennifer.id)

# Taher_Recording = Recording.create(title: "NewRecordingTaherAli", audio: "DoDo.wav/link", user_id: taher.id)
