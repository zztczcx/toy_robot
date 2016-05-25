require 'spec_helper'
require 'toy_robot'

RSpec.describe Robot, "command" do
  context "roam" do
    it "place move" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 0, 0, :NORTH], [:move], [:report]]) }.to  output("0, 1, NORTH").to_stdout
    end 

    it "place left" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 0, 0, :NORTH], [:left], [:report]]) }.to  output("0, 0, WEST").to_stdout
    end 

    it "place move move left move" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:report]]) }.to  output("3, 3, NORTH").to_stdout
    end 

    it "place move move left move" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:report]]) }.to  output("3, 3, NORTH").to_stdout
    end 

    it "place move move left move move move" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:move], [:move], [:report]]) }.to  output("3, 4, NORTH").to_stdout
    end 

    it "place move move left move move move right move" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:move], [:move], [:right], [:move], [:report]]) }.to  output("4, 4, EAST").to_stdout
    end 

    it "place move move left move move move right move place" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:move], [:move], [:right], [:move], [:place, 1, 2, :EAST], [:report]]) }.to  output("1, 2, EAST").to_stdout
    end 

    it "place move move left move move move right move place invalid" do
      t = Table.new(4, 4)
      r = Robot.new(t)
      expect { r.input([[:place, 1, 2, :EAST], [:move], [:move], [:left], [:move], [:move], [:move], [:right], [:move], [:place, 5, 2, :EAST], [:report]]) }.to  output("4, 4, EAST").to_stdout
    end 
  end
end
