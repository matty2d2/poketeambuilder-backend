class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.integer :effect_chance
      t.integer :pp
      t.integer :priority
      t.integer :power
      t.string :damage_class
      t.string :ailment
      t.integer :crit_rate
      t.integer :drain
      t.integer :flinch_chance
      t.integer :healing
      t.integer :min_hits
      t.integer :max_hits
      t.integer :min_turns
      t.integer :max_turns
      t.integer :stat_chance
      t.string :target

      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
