class AddCurrentHpToTeamPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :team_pokemons, :current_hp, :integer
  end
end
