class TypeSerializer < ActiveModel::Serializer
    attributes :name, :moves, :pokemon

    def moves
        ActiveModel::SerializableResource.new(object.moves, each_serializer: MoveSerializer)
    end

    def pokemon
        ActiveModel::SerializableResource.new(object.pokemon, each_serializer: PokemonSerializer)
    end
end
