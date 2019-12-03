class TypesController < ApplicationController

    def show
        user = get_current_user
        type = Type.all.find_by(name: params[:type])
        
        if user
            if type
                render json: { type: TypeSerializer.new(type)}
            else
                render json: {error: 'Unable to find type.'}, status: 401
            end
            
        else
            render json: {error: 'Unable to validate user.'}, status: 401
        end
    end

end
