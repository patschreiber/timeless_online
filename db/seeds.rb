# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding the database..."

# Resets the seeds for static tables
Area.delete_all
Enemy.delete_all
EnemyArea.delete_all

puts "Seeding enemies..."
lambda {
  enemy = Enemy.new
  enemy.id = 1000
  enemy.name = "Imp"
  enemy.description = "A small demon that causes trouble."
  enemy.level = 1
  enemy.base_damage = 2
  enemy.base_defense = 0
  enemy.save!
}.call
puts "Done!"

puts "Seeding areas..."
lambda {
  area = Area.new
  area.id = 1
  area.name = "Tainted Grassland"
  area.save!
}.call
puts "Done!"

puts "Seeding enemy areas..."
puts "Seeding enemy area 1"
lambda {
  enemy_area = EnemyArea.new
  enemy_area.enemy_id = 1000
  enemy_area.area_id = 1
  enemy_area.save!
}.call
puts "Done!"