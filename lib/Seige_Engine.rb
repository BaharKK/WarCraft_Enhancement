require_relative 'barracks'
require_relative 'Peasant'
class Seige_Engine < Unit 
    attr_accessor :health_points, :attack_power

    def initialize(health_points=400, attack_power=50)
       @health_points = health_points
       @attack_power= attack_power
    end


    # class << self
    
    def attack!(enemy)
        case enemy
        when Barracks then enemy.damage(attack_power*2)
        when Seige_Engine then enemy.damage(attack_power)
        when Peasant then return 
        when Footman then return 
        end
    end

    def damage(unit)
        @health_points = health_points - unit
    end

end