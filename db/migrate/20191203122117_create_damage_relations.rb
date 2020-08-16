class CreateDamageRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :damage_relations do |t|
      t.float :effectiveness

      t.timestamps
    end
  end
end
