require_relative 'spec_helper'

# All units can attack and receive damage, so that logic should actually be on the Unit class, not the Peasant class
# This way, you don't have to add damage and attack methods on all types of units

# After making the tests pass, consider what modifications you can make to the Peasant and Footman classes to take advantage of this inheritence
# A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#attack!" do
    it "should result in no damage to enemy's health_points if the unit is dead." do
      expect(@unit).to receive(:health_points).and_return(0)
      enemy_unit = Unit.new(40,5)
      expect(enemy_unit).to_not receive(:damage)
      @unit.attack!(enemy_unit)
    end

    it "should not result in a change in the dead enemy's health_points" do
      enemy_unit = Unit.new(40,5)
      expect(enemy_unit).to receive(:health_points).and_return(-1)
      expect(enemy_unit).to_not receive(:damage)
      @unit.attack!(enemy_unit)
    end
  end 

end
