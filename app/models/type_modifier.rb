class TypeModifier < ApplicationRecord
  belongs_to :type
  belongs_to :target, class_name: 'Type'
  belongs_to :damage_relation
end
