class Team < ApplicationRecord
  validates :name, uniqueness: {scope: :user_id}
  belongs_to :user
  has_many :team_pokemons, dependent: :destroy
  has_many :pokemons, through: :team_pokemons
end
