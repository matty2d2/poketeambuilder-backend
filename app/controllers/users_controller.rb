class UsersController < ApplicationController

    def signin
        user = User.find_by(username: params[:username])
    
        if user && user.authenticate(params[:password])
          # here I know the user is valid!
          token = issue_token({id: user.id})
          render json: { user: user.username, token: issue_token({ id: user.id }) }
        else
          # here I know the user OR password are NOT valid!
          render json: { error:  'Username/password combination is invalid.' }, status: 401
        end
    end

    def validate
        user = get_current_user
        if user
          token = issue_token({id: user.id})
          render json: { token: token, user: user.username}
        else
          render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

    def createuser
        user = User.new(username: params[:username], password: params[:password])

        if user.save
          token = issue_token({id: user.id})
          render json: { token: token, user: user.username}
        else 
          render json: {error: 'Unable to create user.'}, status: 500
        end
    end

    def userteams
        user = get_current_user
        if user
            render json: {teams: ActiveModel::SerializableResource.new(user.teams, each_serializer: TeamSerializer)}
            # user.teams.to_json(:include => {
            #     :team_pokemons => {:include => {:pokemon => {:include => [:types], :only => [:generation, :front_sprite, :back_sprite]}}, :except => [:created_at, :updated_at]}
            # })
        else
            render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

end
