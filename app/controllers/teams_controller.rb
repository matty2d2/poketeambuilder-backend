class TeamsController < ApplicationController

    def maketeam
        user = get_current_user
        if user
            team = Team.create(name: params[:name], user: user)
            params[:pokemon_array].each do |poke_id|
                pokemon = Pokemon.find(poke_id)

                new_hp = pokemon.base_hp + rand(40)
                new_speed = pokemon.base_speed + rand(40)
                new_special_defence = pokemon.base_special_defence + rand(40)
                new_special_attack = pokemon.base_special_attack + rand(40)
                new_defence = pokemon.base_defence + rand(40)
                new_attack = pokemon.base_attack + rand(40)
                level = rand(100)

                tp = TeamPokemon.new(
                    team_id: team.id, 
                    pokemon_id: pokemon.id, 
                    name: pokemon.name,
                    hp: new_hp, 
                    current_hp: new_hp, 
                    speed: new_speed, 
                    special_def: new_special_defence, 
                    special_atk: new_special_attack,
                    defence: new_defence,
                    attack: new_attack,
                    level: level
                )
                tp.save
            end
            render json: { team: team}
          else
            render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

    def deleteteam
        user = get_current_user
        if user
            team = Team.find(params[:team_id])
            team.destroy
            render json: { user_teams: user.teams}
          else
            render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

    def updateteam
        user = get_current_user
        if user
            tp = TeamPokemon.find(params[:id])
            tp[params[:stat]] = params[:value]
            tp.save
            render json: { team_pokemon: tp}
          else
            render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

end
