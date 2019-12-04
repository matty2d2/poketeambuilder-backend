class TypeModifierSerializer < ActiveModel::Serializer
    attributes :attack_type, :damage_relation, :defence_type

    # def attack_relation
    #     ar = Type.find(object.attack_relation_id)
    #     ActiveModel::SerializableResource.new(ar, each_serializer: TypesSerializer)
    # end

    # def defence_relation
    #     dr = Type.find(object.defence_relation_id)
    #     ActiveModel::SerializableResource.new(dr, each_serializer: TypesSerializer)
    # end

    def attack_type
        ar = Type.find(object.attack_relation_id)
        TypesSerializer.new(ar)
    end

    def defence_type
        dr = Type.find(object.defence_relation_id)
        TypesSerializer.new(dr)
    end

    def damage_relation
        ActiveModel::SerializableResource.new(object.damage_relation, each_serializer: DamageRelationSerializer)
    end
end
