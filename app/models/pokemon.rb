class Pokemon < ApplicationRecord
    validates :name, uniqueness: true
    has_many :pokemon_abilities
    has_many :pokemon_types
    has_many :team_pokemons
    has_many :abilities, through: :pokemon_abilities
    has_many :types, through: :pokemon_types
    has_many :teams, through: :team_pokemons
end
