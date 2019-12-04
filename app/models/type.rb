class Type < ActiveRecord::Base
    has_many :pokemon_types
    has_many :pokemon, through: :pokemon_types
    has_many :moves

    # has_many :attack_relations, class_name: "Type", foreign_key: 'defence_relation_id'
    # has_many :defence_relations, class_name: "Type", foreign_key: 'attack_relation_id'

    has_many :a_routes, foreign_key: :defence_relation_id, class_name: 'TypeModifier'
    has_many :attack_relations, through: :a_routes, source: :attack_relation
    
   
    has_many :b_routes, foreign_key: :attack_relation_id, class_name: 'TypeModifier'
    has_many :defence_relations, through: :b_routes, source: :defence_relation
    
    
end
