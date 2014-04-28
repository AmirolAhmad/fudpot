# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

levels = Level.create([{ description: 'Easy' }, { description: 'Super Easy' }, { description: 'Intermediate' }, { description: 'Hard' }, { description: 'Super Hard' }])
categories = Category.create([{ description: 'Appetizers' }, { description: 'Beverages' }, { description: 'Beef' }, { description: 'Breads & Rolls' }, { description: 'Breakfast & Brunch' }, { description: 'Brownies, Bars & Candy' }, { description: 'Burgers, Brats & Dogs' }, { description: 'cake & Cheesecakes' }, { description: 'Cookies' }, { description: 'Desserts' }, { description: 'Dips, Spreads & Sauces' }, { description: 'Ethnic Recipes' }, { description: 'Fish & Seafood' }, { description: 'Grilling' }, { description: 'Healthy Eating' }, { description: 'Holiday Treats' }, { description: 'Kids Cuisine' }, { description: 'Main Dishes' }, { description: 'One Dish Meals' }, { description: 'Pasta & Pizza' }, { description: 'Pies' }, { description: 'Pork' }, { description: 'Poultry' }, { description: 'Salads' }, { description: 'Sandwiches & Wraps' }, { description: 'Sides' }, { description: 'Snacks' }, { description: 'Soups & Stews' }, { description: 'Vegetarian' }])