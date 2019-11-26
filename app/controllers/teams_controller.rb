class TeamsController < ApplicationController

    def maketeam
        user = get_current_user
        if user
            team = Team.create(name: params[:name], user: user)
            params[:pokemon_array].each do |poke_id|
                pokemon = Pokemon.find(poke_id)
                team.pokemons << pokemon
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

end
