class PokemonController < ApplicationController

    def index
        pokemons = Pokemon.all
        render json: pokemons.to_json(:include => {:types => {:only => [:id, :name]}}, :except => [:created_at, :updated_at])
    end

    def stealdata
        #for val in 1..7 do #293 abilities, 18 types, 721 pokemon
            for val in 657..757 do
                poke = PokeApi.get(pokemon: val)
                pokemon = Pokemon.find(val)

                if (pokemon)
                    poke.types.each do |t|
                        type = Type.all.find_by(name: t.type.name)

                        if (type)
                            a = PokemonType.new(pokemon: pokemon, type: type)

                        else
                            byebug
                        end
                    end
                    
                else
                    byebug
                end
            end
            

            # poke.pokemon_species.each do |po|
            #     pokemon = Pokemon.all.find_by(name: po.name)
            #     if (pokemon)
            #         pokemon.generation = 7
            #         pokemon.save
            #     else
            #         byebug
            #     end
                
                
            # end
            # Ability.create(name: poke.name, effect: poke.effect_entries[0].short_effect)

            # Pokemon.create(
            #     name: poke.name, 
            #     base_speed: poke.stats[0].base_stat, 
            #     base_special_defence: poke.stats[1].base_stat, 
            #     base_special_attack: poke.stats[2].base_stat, 
            #     base_defence: poke.stats[3].base_stat, 
            #     base_attack: poke.stats[4].base_stat, 
            #     base_hp: poke.stats[5].base_stat,
            #     back_sprite: poke.sprites.back_default,
            #     front_sprite: poke.sprites.front_default
            # )
        #end
    end
end
