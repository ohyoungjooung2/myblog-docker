# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#categories = Category.create([{name: 'Ruby',slug: 'Ruby-Programming'},{name: 'Rails',slug: 'Rails-Rocks?'},{name: 'Linux',slug: 'Linux-Rocks?'},{name: 'Javascript',slug: 'Javascript?'}])
#Admin user creation
admin_create=User.create(email: 'admin@localhost', password: 'secretpass',admin: true)
