require 'spec_helper'

describe StructureNode do

  before do
    @snode = StructureNode.create(name: "Test Structure Node")
  end

  subject { @snode }

  it { should respond_to(:name) }
  it { should respond_to(:parents) }
  it { should respond_to(:children) }
  it { should respond_to(:friends) }
  it { should respond_to(:content_nodes) }

  it { should be_valid }

  describe "when name is not present" do
    before { @snode.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @snode.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when node has a friend" do
    before do
      @fnode = StructureNode.create(name: "Friend Structure Node")
      @friendship = @snode.node_friendships.build(:friend_id => @fnode.id)
      @friendship.save!
      @snode.save!
      @fnode.save!
      puts "snode #{@snode.id} fnode #{@friendship.friend_id}"
    end

    specify { expect(@snode.node_friendships.size).to eq(1) }
    specify { expect(@fnode.inverse_node_friendships.size).to eq(1) }
    specify { expect(@snode.friends.size).to eq(1) }
    specify { expect(@fnode.inverse_friends.size).to eq(1) }
    specify { expect(@snode.inverse_friends.size).to eq(0) }
    specify { expect(@fnode.friends.size).to eq(0) }
    specify { expect(@snode.friends[0]).to eq(@fnode) }
    specify { expect(@fnode.inverse_friends[0]).to eq(@snode) }
  end

end
