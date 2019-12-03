class MoveSerializer < ActiveModel::Serializer
    attributes :id, :name, :accuracy, :effect_chance, :pp, :priority, :power, :damage_class, :ailment, :crit_rate, :drain, :flinch_chance, :healing, :min_hits, :max_hits, :min_turns, :max_turns, :stat_chance, :target

    # def user_activities
    #     ActiveModel::SerializableResource.new(object.user_activities, each_serializer: UserActivitySerializer)
    # end

end