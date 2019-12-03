class PokemonSerializer < ActiveModel::Serializer
    attributes :name, :base_speed, :base_special_attack, :base_special_defence, :base_attack, :base_defence, :base_hp, :back_sprite, :front_sprite, :generation, :types

    def types
        ActiveModel::SerializableResource.new(object.types, each_serializer: TypesSerializer)
    end

end