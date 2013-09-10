require 'spec_helper'

describe ContentNode do

  before do
    @cnode = ContentNode.create(name: "Test Content Node")
    @snode = StructureNode.create(name: "Test Structure Node")
    @cnode.structure_nodes << @snode
  end

  subject { @cnode }

  it { should respond_to(:name) }
  it { should respond_to(:structure_nodes) }
  it { should respond_to(:lessons) }
  it { should respond_to(:evaluators) }
  it { should respond_to(:prereqs) }
  it { should respond_to(:postreqs) }

  it { should be_valid }

  describe "when name is not present" do
    before { @cnode.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @cnode.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when doesn't belong to a structure node" do
    before do
      @cnode.structure_nodes.clear
      @cnode.save
    end

    specify { expect(@cnode.errors.count).to eq(1) }
    specify { expect(@cnode.errors[:structure_nodes]).to_not eq(nil) }
  end

  pending "test dependency relationships"
end
