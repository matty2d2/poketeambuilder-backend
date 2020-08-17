class TeamPokemon < ApplicationRecord
  validates :hp, :speed, :special_def, :special_atk, :defence, :attack, :level, numericality: { greater_than_or_equal_to: 1,  only_integer: true }
  validates :current_hp, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :hp,  only_integer: true }
  belongs_to :team
  belongs_to :pokemon
end
