class AddLevelToTeamPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :team_pokemons, :level, :integer
  end
end
