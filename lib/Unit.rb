class Unit
    attr_reader :health_points, :attack_power
    def initialize(health_points,attack_power)
        @health_points= health_points
        @attack_power= attack_power
    end
 

 def attack!(enemy)
     enemy.damage(3)
    end

    def damage(unit)
    @health_points = health_points - unit
    end
    

end 