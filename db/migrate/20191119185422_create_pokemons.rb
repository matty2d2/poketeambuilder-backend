class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_speed
      t.integer :base_special_defence
      t.integer :base_special_attack
      t.integer :base_defence
      t.integer :base_attack
      t.integer :base_hp
      t.string :back_sprite
      t.string :front_sprite

      t.timestamps
    end
  end
end
