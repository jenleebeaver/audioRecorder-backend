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

jennifer = User.create(name: "Jennifer Beaver", email:"jen@gmail.com", password: "123456789", image_url: "https://en.wikipedia.org/wiki/File:Judith_1_(cropped).jpg")
taher = User.create(name: "Taher Ali", email:"taher@gmail.com", password: "123456789", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Gustav_Klimt_014.jpg/440px-Gustav_Klimt_014.jpg")

Jennifer_Recording1 = Recording.create(title: "NewRecordingJenniferBeaver",audio_url: "testdata", user_id: jennifer.id)
Jennifer_Recording2 = Recording.create(title: "NewRecordingJenniferBeaver2",audio_url: "testdata", user_id: jennifer.id)

Taher_Recording = Recording.create(title: "NewRecordingTaherAli", audio_url: "DoDo.wav/link", user_id: taher.id)
