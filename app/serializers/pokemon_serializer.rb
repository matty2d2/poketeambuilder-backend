class PokemonSerializer < ActiveModel::Serializer
    attributes :id, :types, :name, :base_speed, :base_special_attack, :base_special_defence, :base_defence, :base_attack, :base_hp, :back_sprite, :front_sprite

    # def user_activities
    #     ActiveModel::SerializableResource.new(object.user_activities, each_serializer: UserActivitySerializer)
    # end

end