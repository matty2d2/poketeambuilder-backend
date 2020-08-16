# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
print "Seeding database:\n\n"

DamageRelation.destroy_all
Type.destroy_all
Pokemon.destroy_all
PokemonType.destroy_all
TeamPokemon.destroy_all
User.destroy_all
Team.destroy_all


print "Creating users...\n"
user1 = User.create(username: 'Mike', password: 'Mike')
user2 = User.create(username: 'Matt', password: 'Matt')
print "Created users...\n\n"

print "Creating damage relati
on types...\n"
##### Damage relation types ######
DamageRelation.create(effectiveness: 1)
DamageRelation.create(effectiveness: 0.5)
DamageRelation.create(effectiveness: 2)
DamageRelation.create(effectiveness: 0 )
print "Created damage relation types.\n\n"

####### Steal data from PokeApi ########
#for val in 1..7 do #293 abilities, 18 types, 721 pokemon, #up to 200 moves

print "Creating types...\n"
# Types data
for val in 1..18 do 
    get_type = PokeApi.get(type: val)
    type = Type.create(name: get_type.name)
end
print "Created types.\n\n"


print "Creating type modifiers...\n"
for val in 1..18 do 
    get_type = PokeApi.get(type: val)
    type = Type.all.find_by(name: get_type.name)


    get_type.damage_relations.no_damage_to.each do |item|
        dmg_rel = DamageRelation.all[3]
        defence_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    end
    
    get_type.damage_relations.double_damage_to.each do |item|
        dmg_rel = DamageRelation.all[2]
        defence_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    end
    
    get_type.damage_relations.half_damage_to.each do |item|
        dmg_rel = DamageRelation.all[1]
        defence_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
    end
    
    get_type.damage_relations.no_damage_from.each do |item|
        dmg_rel = DamageRelation.all[3]
        attack_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    end
    
    get_type.damage_relations.double_damage_from.each do |item|
        dmg_rel = DamageRelation.all[2]
        attack_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    end
    
    get_type.damage_relations.half_damage_from.each do |item|
        dmg_rel = DamageRelation.all[1]
        attack_type = Type.all.find_by(name: item.name)
        TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
    end
end
print "Created type modifiers.\n\n"


print "Creating pokemon...\n"
# # Pokemon and PokemonTypes data
for val in 1..151 do #1st gen
    poke = PokeApi.get(pokemon: val)

    new_poke = Pokemon.create(
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
        PokemonType.create(pokemon: new_poke, type: poke_type)
    end 
end
print "Created pokemon...\n"


########################################





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