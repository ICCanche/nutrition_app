# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

food_categories = FoodCategory.all
unless food_categories.count != 0
    puts "Creating default food categories"
    FoodCategory.create({name:'carne'})
    FoodCategory.create({name:'verduras'})
    FoodCategory.create({name:'frutas'})
    FoodCategory.create({name:'productos'})
end

physical_activities = PhysicalActivity.all
unless physical_activities.count != 0
    puts "Creating default physical activities"
    PhysicalActivity.create({ name: 'Casi ninguna actividad física' })
    PhysicalActivity.create({ name: 'A menudo salgo a caminar' })
    PhysicalActivity.create({ name: 'Ejercicio 1 - 2 veces a la semana' })
    PhysicalActivity.create({ name: 'Ejercicio 3 - 5 veces a la semana' })
    PhysicalActivity.create({ name: 'Ejercicio 5 - 7 veces a la semana' })
end

goals = Goal.all
unless goals.count != 0
    puts "Creating default goals"
    Goal.create({ goalType: "lose_body_fat", name:"Perder grasa" })
    Goal.create({ goalType: "gain_muscle", name:"Subir masa muscular" })
    Goal.create({ goalType: "keep_weight", name:"Mantener peso" })
end