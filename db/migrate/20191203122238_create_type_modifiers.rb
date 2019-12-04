class CreateTypeModifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :type_modifiers do |t|
      t.integer :attack_relation_id
      t.integer :defence_relation_id
      t.references :damage_relation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
