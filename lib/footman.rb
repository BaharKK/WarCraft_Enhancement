class Footman < Unit 
    attr_accessor :health_points, :attack_power

    def initialize(health_points=60, attack_power=10)
       @health_points = health_points
       @attack_power= attack_power
    end


    # class << self
    
    def attack!(enemy)
     enemy.damage(10)
    end

    def damage(unit)
    @health_points = health_points - unit
    end


end