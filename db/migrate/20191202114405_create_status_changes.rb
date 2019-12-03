class CreateStatusChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :status_changes do |t|
      t.integer :change
      t.string :stat_name
      t.references :move, null: false, foreign_key: true

      t.timestamps
    end
  end
end
