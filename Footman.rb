class Footman < Unit 
    attr_accessor :health_points, :AP 

    def initialize(health_points=60, AP=10)
       @health_points = health_points
       @AP = AP
    end


    # class << self

    # def health_points
    #     HP = 60
    #     return HP
    # end

    # def attack_points
    #     AP = 10
    #     return AP 
    # end
end