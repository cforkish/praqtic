require 'spec_helper'

describe StructureNode do

  before do
    @snode = StructureNode.new(name: "Test Structure Node")
  end

  subject { @snode }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @snode.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @snode.name = "a" * 51 }
    it { should_not be_valid }
  end

end
