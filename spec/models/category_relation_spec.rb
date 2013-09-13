require 'spec_helper'

describe CategoryRelation do

  before do
    @relation = CategoryRelation.new()
    @relation.parent = Category.new(name: "Math")
    @relation.child = Category.new(name: "Calculus")
  end

  subject { @relation }

  it { should respond_to :parent }
  it { should respond_to :child }

  it { should be_valid }

  describe "without a parent" do
    before { @relation.parent = nil }
    it { should_not be_valid }
  end

  describe "without a child" do
    before { @relation.child = nil }
    it { should_not be_valid }
  end
end
