class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :pokemons

    # def user_activities
    #     ActiveModel::SerializableResource.new(object.user_activities, each_serializer: UserActivitySerializer)
    # end

end