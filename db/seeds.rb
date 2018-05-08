# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
Ingredient.destroy_all
User.destroy_all
Recipe.destroy_all

Event.create(title: "Mod2 Potluck", location: "Kay", date: "2018-05-07-12:00", details: "Let's celebrate!!!!")
Ingredient.create(name:"Tumeric")
Ingredient.create(name:"Anchovies")
Ingredient.create(name:"Garlic")
@a = User.create(name: "Ahamed", username: "ahamed1", password: "1234")
User.create(name: "Daniel", username: "damndaniel", password: "password")
Recipe.create(name: "Tumeric Caesar Salad", details: "Not good probably", user_id: @a.id)