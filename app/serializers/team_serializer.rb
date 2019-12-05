class TeamSerializer < ActiveModel::Serializer
    attributes :name, :team_pokemons, :id, :not_very_effective_from, :super_effective_from, :immune_from, :not_very_effective_against, :super_effective_against, :immune_against

    def team_pokemons
        ActiveModel::SerializableResource.new(object.team_pokemons, each_serializer: TeamPokemonSerializer)
    end

    def not_very_effective_from
        array = object.not_very_effective_from
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end

    def super_effective_from
        array = object.super_effective_from
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end

    def immune_from
        array = object.immune_from
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end

    def not_very_effective_against
        array = object.not_very_effective_against
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end

    def super_effective_against
        array = object.super_effective_against
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end

    def immune_against
        array = object.immune_against
        ActiveModel::SerializableResource.new(array, each_serializer: TypesSerializer)
    end
end