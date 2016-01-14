require_relative 'spec_helper'

# Barracks should also be able to train seige_engines, much like they could train footmen

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_seige_engine" do
    it "costs 200 gold" do
      @barracks.train_seige_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.train_seige_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do 
      @barracks.train_seige_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "produces a seige_engine unit" do
      seige_engine = @barracks.train_seige_engine
      expect(seige_engine).to be_an_instance_of(Seige_Engine)
    end
  end

  describe "#can_train_seige_engine?" do
    it "returns true if there are enough resources to train a seige_engine" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple peasants
      expect(@barracks.can_train_seige_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

     it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end
  end

  describe "#train_seige_engine" do
    it "does not train a seige_engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_seige_engine?).and_return(false)
      expect(@barracks.train_peasant).to be_nil
    end
    it "trains a seige_engine if there are enough resources" do
      expect(@barracks).to receive(:can_train_seige_engine?).and_return(true)
      expect(@barracks.train_seige_engine).to be_a(Seige_Engine)
    end
  end

end