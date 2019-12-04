class PokemonController < ApplicationController

    def index
        pokemons = Pokemon.all
        render json: pokemons.to_json(:include => {:types => {:only => [:id, :name]}}, :except => [:created_at, :updated_at])
    end

    def stealdata
        #for val in 1..7 do #293 abilities, 18 types, 721 pokemon
        for val in 1..18 do #up to 200 moves
            poke = PokeApi.get(type: val)

            type = Type.all.find_by(name: poke.name)
            byebug

            poke.damage_relations.no_damage_to.each do |item|
                dmg_rel = DamageRelation.all[3]
                defence_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
            end

            poke.damage_relations.double_damage_to.each do |item|
                dmg_rel = DamageRelation.all[2]
                defence_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
            end

            poke.damage_relations.half_damage_to.each do |item|
                dmg_rel = DamageRelation.all[1]
                defence_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: defence_type, defence_relation: type, damage_relation: dmg_rel)
            end

            poke.damage_relations.no_damage_from.each do |item|
                dmg_rel = DamageRelation.all[3]
                attack_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
            end

            poke.damage_relations.double_damage_from.each do |item|
                dmg_rel = DamageRelation.all[2]
                attack_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
            end

            poke.damage_relations.half_damage_from.each do |item|
                dmg_rel = DamageRelation.all[1]
                attack_type = Type.all.find_by(name: item.name)
                TypeModifier.create(attack_relation: type, defence_relation: attack_type, damage_relation: dmg_rel)
            end
        end
        byebug
    end
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

                #     if (!sc)
                #         byebug
                #     end
            #     end


            # done = 'done'
            # byebug
end
