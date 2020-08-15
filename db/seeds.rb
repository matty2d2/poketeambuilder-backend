# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Type.destroy_all
Pokemon.destroy_all
PokemonType.destroy_all

####### Steal Pokemon from PokeApi ########
#for val in 1..7 do #293 abilities, 18 types, 721 pokemon, #up to 200 moves

# Types data
for val in 1..18 do 
    type = PokeApi.get(type: val)
    Type.create(name: type.name)
end

# # Pokemon and PokemonTypes data
for val in 1..151 do #1st gen
    poke = PokeApi.get(pokemon: val)

    Pokemon.create(
        name: poke.name, 
        base_speed: poke.stats[5].base_stat,
        base_special_defence: poke.stats[4].base_stat,
        base_special_attack: poke.stats[3].base_stat,
        base_defence: poke.stats[2].base_stat,
        base_attack: poke.stats[1].base_stat,
        base_hp: poke.stats[0].base_stat,
        back_sprite: poke.sprites.back_default,
        front_sprite: poke.sprites.front_default,
        generation: 1,
        )

    poke.types.each do |item|
        poke_type = Type.all.find_by(name: item.type.name)
        PokemonType.create(pokemon_id: poke.id, type_id: poke_type.id)
    end 
end


########################################



TeamPokemon.destroy_all
User.destroy_all
Team.destroy_all

# DamageRelation.destroy_all

user1 = User.create(username: 'Mike', password: 'Mike')
user2 = User.create(username: 'Matt', password: 'Matt')


        # poke.damage_relations.no_damage_to.each do |item|
    #     dmg_rel = DamageRelation.all[3]
    #     defence_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    # end

    # poke.damage_relations.double_damage_to.each do |item|
    #     dmg_rel = DamageRelation.all[2]
    #     defence_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    # end

    # poke.damage_relations.half_damage_to.each do |item|
    #     dmg_rel = DamageRelation.all[1]
    #     defence_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    # end

    # poke.damage_relations.no_damage_from.each do |item|
    #     dmg_rel = DamageRelation.all[3]
    #     attack_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    # end

    # poke.damage_relations.double_damage_from.each do |item|
    #     dmg_rel = DamageRelation.all[2]
    #     attack_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    # end

    # poke.damage_relations.half_damage_from.each do |item|
    #     dmg_rel = DamageRelation.all[1]
    #     attack_type = Type.all.find_by(name: item.name)
    #     TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    # end

        # move = Move.create(
        #         name: poke.name, 
        #         accuracy: poke.accuracy, 
        #         effect_chance: poke.effect_chance, 
        #         pp: poke.pp, 
        #         priority: poke.priority, 
        #         power: poke.power, 
        #         damage_class: poke.damage_class.name,
        #         ailment: poke.meta.ailment.name,
        #         crit_rate: poke.meta.crit_rate,
        #         drain: poke.meta.drain,
        #         flinch_chance: poke.meta.flinch_chance,
        #         healing: poke.meta.healing,
        #         min_hits: poke.meta.min_hits,
        #         max_hits: poke.meta.max_hits,
        #         min_turns: poke.meta.min_turns,
        #         max_turns: poke.meta.max_turns,
        #         stat_chance: poke.meta.stat_chance,
        #         target: poke.target.name,
        #         type: type
        #)

        # for c in poke.stat_changes do
        #     sc = StatusChange.create(change: c.change, stat_name: c.stat.name, move: move)
        # end