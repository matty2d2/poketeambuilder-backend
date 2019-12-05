class Team < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {scope: :user_id}
  belongs_to :user
  has_many :team_pokemons, dependent: :destroy
  has_many :pokemons, through: :team_pokemons

  def not_very_effective_from
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:a_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[1]}
    newest_array = new_array.map{|it| it.attack_relation}
    return newest_array
  end

  def super_effective_from
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:a_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[2]}
    newest_array = new_array.map{|it| it.attack_relation}
    return newest_array
end

def immune_from
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:a_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[3]}
    newest_array = new_array.map{|it| it.attack_relation}
    return newest_array
end

def not_very_effective_against
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:b_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[1]}
    newest_array = new_array.map{|it| it.defence_relation}
    return newest_array
end

def super_effective_against
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:b_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[2]}
    newest_array = new_array.map{|it| it.defence_relation}
    return newest_array
end

def immune_against
    array = self.team_pokemons.map{|tp| tp.pokemon.types}.flatten().map(&:b_routes).flatten()
    new_array = array.select{|i| i.damage_relation == DamageRelation.all[3]}
    newest_array = new_array.map{|it| it.defence_relation}
    return newest_array
end

end
