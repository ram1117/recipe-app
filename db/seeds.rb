# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

#

# Examples:

#

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

#   Character.create(name: "Luke", movie: movies.first)

Food.destroy_all

User.destroy_all



User.create([

  {

    name: "J. kent",

  },

  {

    name: "Wes Gibbins",

  }

])



Food.create([

    {

      name: "Pizza",

      measurement_unit: "grams",

      price: 22.99,

      quantity: 2,

      user_id: 1

    },

    {

      name: "Burger",

      measurement_unit: "grams",

      price: 5.00,

      quantity: 4,

      user_id: 1

    },

    {

      name: "Lasagna",

      measurement_unit: "grams",

      price: 11.99,

      quantity: 3,

      user_id: 2

    },

    {

      name: "Jollof Rice",

      measurement_unit: "grams",

      price: 25.00,

      quantity: 1,

      user_id: 2

    }

]);



  print "Added #{Food.count} foods"

  print "Added #{User.count} users"