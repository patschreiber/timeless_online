class EnemyArea < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :area
end