require_relative 'spec_helper'

# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against buildings such as the Barracks. 
# It is however ineffective against other units (can't attack them, as though they were dead).

# So unlike with Footman (whose attacks do a fraction of the damage they normally would), 
# the SiegeEngine does 2x the damage against the Barracks

# Also, Siege Engines can attack other siege engines even though they cannot attack any other units (such as Peasants or Footmen)

# Stats:

# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food

describe Seige_Engine do

  before :each do
    @seige_engine = Seige_Engine.new
  end

  it "has and knows its HP (health points)" do
    expect(@seige_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@seige_engine.attack_power).to eq(50)
  end

describe "#attack!" do
    it "should do deal 100 (AP*2) damage to the Barracks unit" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(100)
      @seige_engine.attack!(enemy)
    end
    
    it "should not attack any Peasants" do
      enemy = Peasant.new
      expect(enemy).to_not receive(:damage)
      @seige_engine.attack!(enemy)
    end

     it "should not attack any Footman" do
      enemy = Peasant.new
      expect(enemy).to_not receive(:damage)
      @seige_engine.attack!(enemy)
    end

     it "should do deal 50 (AP) damage to another seige_engine unit" do
      enemy = Seige_Engine.new
      expect(enemy).to receive(:damage).with(50)
      @seige_engine.attack!(enemy)
    end

  end


 

end