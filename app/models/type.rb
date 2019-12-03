class Type < ApplicationRecord
    has_many :pokemon_types
    has_many :pokemon, through: :pokemon_types
    has_many :moves
    has_many :type_modifiers
end
