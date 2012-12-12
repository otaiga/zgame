require 'spec_helper'

describe Toblerone do
  it "should be out on its own" do
    Toblerone.new.should == out_on_its_own
  end

  it "should be triangular chocolate" do
    Toblerone.new.should == triangular_chocolate
  end

  it "should be toblerone" do
    Toblerone.new.should == thats_toblerone
  end

  it "should have triangular almonds" do
    toblerone = Toblerone.first
    toblerone.triangular_almonds.should == true
  end

  it "should have triangular trees" do
    toblerone = Toblerone.first
    toblerone.triangular_trees.should == true
  end

  it "should have triangular honey" do
    toblerone = Toblerone.first
    toblerone.triangular_honey.should == true
  end

  it "should have triangular bees" do
    toblerone = Toblerone.first
    toblerone.triangular_bees.should == true
  end
  
end
