class TypeModifier < ActiveRecord::Base
  validates :attack_relation_id, uniqueness: {scope: :defence_relation_id}
  validates :defence_relation_id, uniqueness: {scope: :attack_relation_id}

  belongs_to :attack_relation, foreign_key: 'attack_relation_id',class_name: 'Type'
  belongs_to :defence_relation, foreign_key: 'defence_relation_id', class_name: 'Type'

  belongs_to :damage_relation
end
