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
EnemyLootTable.delete_all
EnemySkill.delete_all
Item.delete_all
Level.delete_all
Skill.delete_all

puts "Seeding areas..."
  lambda {
    area = Area.new
    area.id = 1
    area.name = "Tainted Grassland"
    area.save!
  }.call

  lambda {
    area = Area.new
    area.id = 2
    area.name = "Creepy Hollow"
    area.save!
  }.call

  lambda {
    area = Area.new
    area.id = 3
    area.name = "Metal Plains"
    area.save!
  }.call
puts "Done!"

puts "Seeding enemies..."
  lambda {
    enemy = Enemy.new
    enemy.id = 1000
    enemy.name = "Imp"
    enemy.description = "A small demon that causes trouble."
    enemy.level = 1
    enemy.experience = 10
    enemy.ap = 1
    enemy.hp = 25
    enemy.mp = 10
    enemy.base_attack = 2
    enemy.base_defense = 0
    enemy.speed = 100
    enemy.save!
  }.call

  lambda {
    enemy = Enemy.new
    enemy.id = 1001
    enemy.name = "Bubbling Pox"
    enemy.description = "An overgrown fungi that is about to pop."
    enemy.level = 2
    enemy.experience = 15
    enemy.ap = 1
    enemy.hp = 35
    enemy.mp = 10
    enemy.base_attack = 5
    enemy.base_defense = 1
    enemy.speed = 105
    enemy.save!
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

  lambda {
    enemy_area = EnemyArea.new
    enemy_area.enemy_id = 1001
    enemy_area.area_id = 1
    enemy_area.save!
  }.call
puts "Done!"

puts "Seeding skills..."
  lambda {
    skill = Skill.new
    skill.id = 1
    skill.name = "Bash"
    skill.description = "Attack with the bluntside of your weapon."
    skill.damage = 10
    skill.ap = 10
    skill.save!
  }.call
puts "Done!"

puts "Seeding enemy loot tables..."
  lambda {
    loot_table = EnemyLootTable.new
    loot_table.id = 1000
    loot_table.rarity = 1
    loot_table.save!
  }.call
puts "Done!"

puts "Seeding enemy skills..."
  lambda {
    enemy_skill = EnemySkill.new
    enemy_skill.enemy_id = 1000
    enemy_skill.skill_id = 1
    enemy_skill.save!
  }.call
puts "Done!"

puts "Seeding items..."
  lambda {
    item = Item.new
    item.id = 1000
    item.name = "Test Hoodie"
    item.description = "This isn't a hoodie, this is a test."
    item.save!
  }.call
puts "Done!"

puts "Adding level requirements to the database..."
  lambda {
    level = Level.new
    level.id = 1
    level.level = 1
    level.experience_required = 0
    level.save!

    level = Level.new
    level.id = 2
    level.level = 2
    level.experience_required = 30
    level.save!

    level = Level.new
    level.id = 3
    level.level = 3
    level.experience_required = 38
    level.save!

    level = Level.new
    level.id = 4
    level.level = 4
    level.experience_required = 49
    level.save!

    level = Level.new
    level.id = 5
    level.level = 5
    level.experience_required = 63
    level.save!

    level = Level.new
    level.id = 6
    level.level = 6
    level.experience_required = 79
    level.save!

    level = Level.new
    level.id = 7
    level.level = 7
    level.experience_required = 98
    level.save!

    level = Level.new
    level.id = 8
    level.level = 8
    level.experience_required = 120
    level.save!

    level = Level.new
    level.id = 9
    level.level = 9
    level.experience_required = 146
    level.save!

    level = Level.new
    level.id = 10
    level.level = 10
    level.experience_required = 176
    level.save!

    level = Level.new
    level.id = 11
    level.level = 11
    level.experience_required = 210
    level.save!

    level = Level.new
    level.id = 12
    level.level = 12
    level.experience_required = 248
    level.save!

    level = Level.new
    level.id = 13
    level.level = 13
    level.experience_required = 290
    level.save!

    level = Level.new
    level.id = 14
    level.level = 14
    level.experience_required = 338
    level.save!

    level = Level.new
    level.id = 15
    level.level = 15
    level.experience_required = 390
    level.save!

    level = Level.new
    level.id = 16
    level.level = 16
    level.experience_required = 449
    level.save!

    level = Level.new
    level.id = 17
    level.level = 17
    level.experience_required = 513
    level.save!

    level = Level.new
    level.id = 18
    level.level = 18
    level.experience_required = 584
    level.save!

    level = Level.new
    level.id = 19
    level.level = 19
    level.experience_required = 662
    level.save!

    level = Level.new
    level.id = 20
    level.level = 20
    level.experience_required = 746
    level.save!

    level = Level.new
    level.id = 21
    level.level = 21
    level.experience_required = 839
    level.save!

    level = Level.new
    level.id = 22
    level.level = 22
    level.experience_required = 940
    level.save!

    level = Level.new
    level.id = 23
    level.level = 23
    level.experience_required = 1050
    level.save!

    level = Level.new
    level.id = 24
    level.level = 24
    level.experience_required = 1169
    level.save!

    level = Level.new
    level.id = 25
    level.level = 25
    level.experience_required = 1298
    level.save!

    level = Level.new
    level.id = 26
    level.level = 26
    level.experience_required = 1437
    level.save!

    level = Level.new
    level.id = 27
    level.level = 27
    level.experience_required = 1588
    level.save!

    level = Level.new
    level.id = 28
    level.level = 28
    level.experience_required = 1751
    level.save!

    level = Level.new
    level.id = 29
    level.level = 29
    level.experience_required = 1927
    level.save!

    level = Level.new
    level.id = 30
    level.level = 30
    level.experience_required = 2117
    level.save!

    level = Level.new
    level.id = 31
    level.level = 31
    level.experience_required = 2321
    level.save!

    level = Level.new
    level.id = 32
    level.level = 32
    level.experience_required = 2540
    level.save!

    level = Level.new
    level.id = 33
    level.level = 33
    level.experience_required = 2776
    level.save!

    level = Level.new
    level.id = 34
    level.level = 34
    level.experience_required = 3030
    level.save!

    level = Level.new
    level.id = 35
    level.level = 35
    level.experience_required = 3302
    level.save!

    level = Level.new
    level.id = 36
    level.level = 36
    level.experience_required = 3594
    level.save!

    level = Level.new
    level.id = 37
    level.level = 37
    level.experience_required = 3907
    level.save!

    level = Level.new
    level.id = 38
    level.level = 38
    level.experience_required = 4242
    level.save!

    level = Level.new
    level.id = 39
    level.level = 39
    level.experience_required = 4601
    level.save!

    level = Level.new
    level.id = 40
    level.level = 40
    level.experience_required = 4986
    level.save!

    level = Level.new
    level.id = 41
    level.level = 41
    level.experience_required = 5397
    level.save!

    level = Level.new
    level.id = 42
    level.level = 42
    level.experience_required = 5837
    level.save!

    level = Level.new
    level.id = 43
    level.level = 43
    level.experience_required = 6307
    level.save!

    level = Level.new
    level.id = 44
    level.level = 44
    level.experience_required = 6810
    level.save!

    level = Level.new
    level.id = 45
    level.level = 45
    level.experience_required = 7347
    level.save!

    level = Level.new
    level.id = 46
    level.level = 46
    level.experience_required = 7920
    level.save!

    level = Level.new
    level.id = 47
    level.level = 47
    level.experience_required = 8532
    level.save!

    level = Level.new
    level.id = 48
    level.level = 48
    level.experience_required = 9186
    level.save!

    level = Level.new
    level.id = 49
    level.level = 49
    level.experience_required = 9883
    level.save!

    level = Level.new
    level.id = 50
    level.level = 50
    level.experience_required = 10626
    level.save!

    level = Level.new
    level.id = 51
    level.level = 51
    level.experience_required = 11419
    level.save!

    level = Level.new
    level.id = 52
    level.level = 52
    level.experience_required = 12264
    level.save!

    level = Level.new
    level.id = 53
    level.level = 53
    level.experience_required = 13165
    level.save!

    level = Level.new
    level.id = 54
    level.level = 54
    level.experience_required = 14125
    level.save!

    level = Level.new
    level.id = 55
    level.level = 55
    level.experience_required = 15148
    level.save!

    level = Level.new
    level.id = 56
    level.level = 56
    level.experience_required = 16237
    level.save!

    level = Level.new
    level.id = 57
    level.level = 57
    level.experience_required = 17397
    level.save!

    level = Level.new
    level.id = 58
    level.level = 58
    level.experience_required = 18633
    level.save!

    level = Level.new
    level.id = 59
    level.level = 59
    level.experience_required = 19948
    level.save!

    level = Level.new
    level.id = 60
    level.level = 60
    level.experience_required = 21348
    level.save!

    level = Level.new
    level.id = 61
    level.level = 61
    level.experience_required = 22837
    level.save!

    level = Level.new
    level.id = 62
    level.level = 62
    level.experience_required = 24423
    level.save!

    level = Level.new
    level.id = 63
    level.level = 63
    level.experience_required = 26109
    level.save!

    level = Level.new
    level.id = 64
    level.level = 64
    level.experience_required = 27903
    level.save!

    level = Level.new
    level.id = 65
    level.level = 65
    level.experience_required = 29811
    level.save!

    level = Level.new
    level.id = 66
    level.level = 66
    level.experience_required = 31841
    level.save!

    level = Level.new
    level.id = 67
    level.level = 67
    level.experience_required = 33999
    level.save!

    level = Level.new
    level.id = 68
    level.level = 68
    level.experience_required = 36293
    level.save!

    level = Level.new
    level.id = 69
    level.level = 69
    level.experience_required = 38732
    level.save!

    level = Level.new
    level.id = 70
    level.level = 70
    level.experience_required = 41325
    level.save!

    level = Level.new
    level.id = 71
    level.level = 71
    level.experience_required = 44081
    level.save!

    level = Level.new
    level.id = 72
    level.level = 72
    level.experience_required = 47011
    level.save!

    level = Level.new
    level.id = 73
    level.level = 73
    level.experience_required = 50124
    level.save!

    level = Level.new
    level.id = 74
    level.level = 74
    level.experience_required = 53431
    level.save!

    level = Level.new
    level.id = 75
    level.level = 75
    level.experience_required = 56946
    level.save!

    level = Level.new
    level.id = 76
    level.level = 76
    level.experience_required = 60680
    level.save!

    level = Level.new
    level.id = 77
    level.level = 77
    level.experience_required = 64647
    level.save!

    level = Level.new
    level.id = 78
    level.level = 78
    level.experience_required = 68860
    level.save!

    level = Level.new
    level.id = 79
    level.level = 79
    level.experience_required = 73336
    level.save!

    level = Level.new
    level.id = 80
    level.level = 80
    level.experience_required = 78090
    level.save!

    level = Level.new
    level.id = 81
    level.level = 81
    level.experience_required = 83139
    level.save!

    level = Level.new
    level.id = 82
    level.level = 82
    level.experience_required = 88500
    level.save!

    level = Level.new
    level.id = 83
    level.level = 83
    level.experience_required = 94194
    level.save!

    level = Level.new
    level.id = 84
    level.level = 84
    level.experience_required = 100239
    level.save!

    level = Level.new
    level.id = 85
    level.level = 85
    level.experience_required = 106658
    level.save!

    level = Level.new
    level.id = 86
    level.level = 86
    level.experience_required = 113474
    level.save!

    level = Level.new
    level.id = 87
    level.level = 87
    level.experience_required = 120709
    level.save!

    level = Level.new
    level.id = 88
    level.level = 88
    level.experience_required = 128391
    level.save!

    level = Level.new
    level.id = 89
    level.level = 89
    level.experience_required = 136545
    level.save!

    level = Level.new
    level.id = 90
    level.level = 90
    level.experience_required = 145200
    level.save!

    level = Level.new
    level.id = 91
    level.level = 91
    level.experience_required = 154388
    level.save!

    level = Level.new
    level.id = 92
    level.level = 92
    level.experience_required = 164139
    level.save!

    level = Level.new
    level.id = 93
    level.level = 93
    level.experience_required = 174490
    level.save!

    level = Level.new
    level.id = 94
    level.level = 94
    level.experience_required = 185474
    level.save!

    level = Level.new
    level.id = 95
    level.level = 95
    level.experience_required = 197132
    level.save!

    level = Level.new
    level.id = 96
    level.level = 96
    level.experience_required = 209504
    level.save!

    level = Level.new
    level.id = 97
    level.level = 97
    level.experience_required = 222632
    level.save!

    level = Level.new
    level.id = 98
    level.level = 98
    level.experience_required = 236564
    level.save!

    level = Level.new
    level.id = 99
    level.level = 99
    level.experience_required = 251347
    level.save!
  }.call
puts "Done!"