# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

#   Character.create(name: "Luke", movie: movies.first)

Food.destroy_all

User.destroy_all

user1 = User.create(name: 'J. kent', email: 'user1@test.com', password: 'password')
user2 = User.create(name: 'Wes Gibbins', email: 'user2@test.com', password: 'password')

Food.create([
              {
                name: 'banana',
                measurement_unit: 'units',
                price: 1.5,
                quantity: 10,
                user_id: user1.id
              },

              {
                name: 'flour',
                measurement_unit: 'kilograms',
                price: 3.00,
                quantity: 5,
                user_id: user1.id
              },

              {
                name: 'potatoes',
                measurement_unit: 'kilograms',
                price: 2.5,
                quantity: 4,
                user_id: user1.id
              },

              {
                name: 'tuna',
                measurement_unit: 'kilograms',
                price: 5,
                quantity: 2,
                user_id: user2.id
              }

            ])

Recipe.create([
                { user: user1, name: 'Banana bread', preparation_time: 1.0, cooking_time: 1.5, public: true,
                  description: "
                  This banana bread has been the most popular recipe on Simply Recipes for over 10
                  years.Thousands of people make it every day. Why? Because it really is the best
                  banana bread recipe, period. You can mix everything in one bowl, you can vary
                  the amount of sugar or bananas. And the secret to its great flavor? Melted
                  butter. Overhead view of a slice of banana bread on a plate. The beauty of this
                  banana bread recipe is you don't need a fancy mixer! A mixing bowl,a fork to
                  whisk the eggs, and a sturdy spoon to mix the batter are all you need. The sugar
                  amount is flexible. The original recipe called for a cup of white sugar, but
                  most people, including me, do just fine with 3/4 cup, and many are happy with
                  1/2 cup. You can toss in a cup of chopped nuts, raisins,or chocolate chips if
                  you want, or put the batter into muffin tins and make banana nut muffins
                  instead. You can even go a step further and make chocolate banana bread.
                  " },

                { user: user1, name: 'Kartoffelalat', preparation_time: 1.0, cooking_time: 2, public: false,
                  description: "
                  This authentic German potato salad comes from the Swabia region of southern
                  Germany where it remains one of the most popular and most delicious of all
                  potato salads! German german potato salad recipe authentic traditional swabian
                  schwabischer vinegar broth I’m a huge potato salad fan and I enjoy it in all its
                  varieties.  But my all-time favorite is Schwäbischer Kartoffelsalat from the
                  Southern Germany region of Swabia where I grew up (Stuttgart). I’m also the
                  ultimate critic when it comes to potato salads.  I’ve probably eaten Swabian
                  potato salad a couple of hundred different times throughout my life in Germany
                  and I will tell you, not all potato salads are created equal, that’s for sure.
                  Hands down the best versions I’ve had were served in southern German
                  restaurants.  For any of you who have lived in or visited that area of Germany,
                  you know exactly what I’m talking about:  You just can’t beat that
                  restaurant-style Swabian potato salad." },
                {
                  user: user2, name: 'Salade Niçoise', preparation_time: 1.0, cooking_time: 1, public: true,
                  description: "
                  To make the dressing or marinade whisk together the red wine vinegar, olive
                  oil, parsley, chives, garlic, salt and pepper.

                      Place the tuna in a shallow dish and pour over half of the dressing. Cover
                  and chill for 1-2 hours to allow the fish to marinate. Toss in the marinade from
                  time to time.

                      Heat a ridged griddle pan on the hob or a hot barbecue for 5 minutes. Remove
                  the tuna from the marinade. Cook the tuna steaks for 2-3 minutes on each side,
                  depending on how rare you like your fish.

                      Lay the lettuce leaves onto a large plate and add the lettuce, onion,
                  tomatoes, potato, tuna, beans and anchovies. Drizzle over the remaining dressing
                  then finish by adding the eggs, olives and ripped basil leaves.
                  "
                }
              ])

print "Added #{Food.count} foods \n"

print "Added #{User.count} users \n"

print "Added #{Recipe.count} recipes \n"
