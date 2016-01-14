require_relative 'barracks'
class Footman < Unit 
    attr_accessor :health_points, :attack_power

    def initialize(health_points=60, attack_power=10)
       @health_points = health_points
       @attack_power= attack_power
    end


    # class << self
    
    def attack!(enemy)
        case enemy
        when Barracks then enemy.damage (attack_power / 2.0).ceil
        else
            enemy.damage(attack_power)
        end
        # if  enemy.is_a?(Barracks)
        #     enemy.damage(attack_power / 2)
        # else
        #     enemy.damage(attack_power)
        # end
    end

    def damage(unit)
        @health_points = health_points - unit
    end

end