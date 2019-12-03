class CreateTypeModifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :type_modifiers do |t|
      t.references :type, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true
      t.references :damage_relation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
