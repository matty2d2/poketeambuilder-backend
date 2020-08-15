class PokemonController < ApplicationController

    def index
        pokemons = Pokemon.all
        render json: pokemons.to_json(:include => {:types => {:only => [:id, :name]}}, :except => [:created_at, :updated_at])
    end

end
