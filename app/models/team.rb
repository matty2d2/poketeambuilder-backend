class Team < ApplicationRecord
  belongs_to :user
  has_many :team_pokemons
  has_many :pokemons, through: :team_pokemons
end
