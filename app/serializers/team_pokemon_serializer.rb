class TeamPokemonSerializer < ActiveModel::Serializer
    attributes :id, :level, :name, :speed, :special_def, :special_atk, :defence, :attack, :hp, :current_hp, :back_sprite, :front_sprite, :generation, :types

    def team_pokemons
        ActiveModel::SerializableResource.new(object.types, each_serializer: TypesSerializer)
    end

    def back_sprite
        object.pokemon.back_sprite
    end

    def front_sprite
        object.pokemon.front_sprite
    end

    def generation
        object.pokemon.generation
    end

    def types
        types = object.pokemon.types
        ActiveModel::SerializableResource.new(types, each_serializer: TypesSerializer)
    end
end