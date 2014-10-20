class EnemySkill < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :skill
end