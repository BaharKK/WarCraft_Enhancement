class Barracks
    attr_accessor :gold , :food
    def initialize(gold=1000,food=80)
        @gold = gold
        @food = food
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
end
