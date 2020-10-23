class LevelSetting < ApplicationRecord
  validates :level, uniqueness: true
  validates :threshold, uniqueness: true
end
