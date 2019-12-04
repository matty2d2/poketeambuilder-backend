class TypeSerializer < ActiveModel::Serializer
    attributes :name, :moves, :pokemon, :offence, :defence

    def moves
        ActiveModel::SerializableResource.new(object.moves, each_serializer: MoveSerializer)
    end

    def pokemon
        ActiveModel::SerializableResource.new(object.pokemon, each_serializer: PokemonSerializer)
    end

    def defence
        ActiveModel::SerializableResource.new(object.a_routes, each_serializer: TypeModifierSerializer)
    end

    def offence
        ActiveModel::SerializableResource.new(object.b_routes, each_serializer: TypeModifierSerializer)
    end
end
