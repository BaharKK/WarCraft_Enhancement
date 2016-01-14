class Barracks
    attr_accessor :gold , :food, :health_points, :lumber
    def initialize(gold=1000,food=80, health_points=500,lumber=500)
        @food = food
        @health_points = health_points
        @lumber = lumber
    end

 
    def train_footman
        if can_train_footman?
           @gold = @gold - 135
           @food = @food - 2
           Footman.new
        end 
    end 

    def train_peasant 
        if can_train_peasant?
            @gold = @gold - 90
            @food = @food - 5
           Peasant.new 
        end
    end


    def train_seige_engine 
        if can_train_seige_engine?
            @gold = @gold - 200
            @food = @food - 3
            @lumber = @lumber - 60
            Seige_Engine.new 
        end
    end

    def can_train_peasant? 
        (gold >= 90) && (food >= 5)
    end

     def can_train_footman?
        (gold >= 135) && (food >= 2)
        # if (@gold < 135) && (@food < 2)
        #     false
        # else 
        #     false
        # end
    end
    
    def can_train_seige_engine?
        (gold >= 200) && (food >= 3) && (lumber >= 60)
    end

end
