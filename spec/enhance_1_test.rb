require_relative 'spec_helper'
# In most strategy games, like Warcraft III, buildings can also be attacked by units.
# Since a barracks is a building, it has substantial more HP (500) To make matters worse, 
# a Footman does only HALF of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.
# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.
# classes to take advantage of this inheritence

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should reduce the barrack's health_points by half of the attack_power specified" do
      enemy_barracks = Barracks.new
      expect(enemy_barracks).to receive(:damage).with(5)

      @footman.attack!(enemy_barracks)
    end
  end

end 
 
