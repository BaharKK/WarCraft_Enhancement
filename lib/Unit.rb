class Unit
    attr_reader :health_points, :attack_power
    def initialize(health_points,attack_power)
        @health_points= health_points
        @attack_power= attack_power
    end
 

    def attack!(enemy)
        if dead? || enemy.dead?
            return 
        end
        enemy.damage(3)
    end

    def damage(unit)
        @health_points = health_points - unit
    end
    
    def dead? 
        health_points <= 0 
    end

end 