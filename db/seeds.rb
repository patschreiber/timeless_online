# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding the database..."

# Resets the seeds for static tables
Enemy.delete_all

puts "Seeding Enemies..."
lambda {
  enemy = Enemy.new
  enemy.id = 1000
  enemy.name = "Imp"
  enemy.description = "A small demon that causes trouble."
  enemy.level = 1
  enemy.base_damage = 2
  enemy.base_defense = 0
}.call

