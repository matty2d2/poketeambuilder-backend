class PokemonType < ApplicationRecord
  validates :pokemon_id, uniqueness: {scope: :type_id}
  belongs_to :pokemon
  belongs_to :type
end
