require 'spec_helper'

describe CategoryFriendship do

  before do
    @friendship = CategoryFriendship.new()
    @snode = Category.new(name: "Node A")
    @fnode = Category.new(name: "Node B")
    @friendship.category = @snode
    @friendship.friend = @fnode
  end

  subject { @friendship }

  it { should respond_to(:category) }
  it { should respond_to(:friend) }

  it { should be_valid }

  describe "when doesn't belong to a structure node" do
    before do
      @friendship.category = nil
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
