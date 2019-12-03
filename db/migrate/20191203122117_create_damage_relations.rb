class CreateDamageRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :damage_relations do |t|
      t.string :effectiveness

      t.timestamps
    end
  end
end
