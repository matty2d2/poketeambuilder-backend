class CreateTeamPokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :team_pokemons do |t|
      t.string :name
      t.integer :speed
      t.integer :special_def
      t.integer :special_atk
      t.integer :defence
      t.integer :attack
      t.integer :hp
      t.references :team, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
