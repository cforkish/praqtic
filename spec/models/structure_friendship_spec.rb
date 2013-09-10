require 'spec_helper'

describe StructureFriendship do

  before do
    @friendship = StructureFriendship.new()
    @snode = StructureNode.new(name: "Node A")
    @fnode = StructureNode.new(name: "Node B")
    @friendship.structure_node = @snode
    @friendship.friend = @fnode
  end

  subject { @friendship }

  it { should respond_to(:structure_node) }
  it { should respond_to(:friend) }

  it { should be_valid }

  describe "when doesn't belong to a structure node" do
    before do
      @friendship.structure_node = nil
    end

    it { should_not be_valid }
  end

  describe "when doesn't belong to a friend node" do
    before do
      @friendship.friend = nil
    end

    it { should_not be_valid }
  end

end
