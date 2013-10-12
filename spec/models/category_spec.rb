require 'spec_helper'

describe Category do

  before do
    @snode = Category.create(name: "Test Structure Node")
  end

  subject { @snode }

  it { should respond_to(:name) }
  it { should respond_to(:parent_relations) }
  it { should respond_to(:parents) }
  it { should respond_to(:child_relations) }
  it { should respond_to(:children) }
  it { should respond_to(:friendships) }
  it { should respond_to(:friends) }
  it { should respond_to(:inverse_friendships) }
  it { should respond_to(:inverse_friends) }
  it { should respond_to(:classifications) }
  it { should respond_to(:quizzes) }

  it { should be_valid }

  describe "when name is not present" do
    before { @snode.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @snode.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "parents association" do
    let(:other_category) { Category.create(name: "Category") }
    before do
      CategoryRelation.create(:parent => other_category, :child => @snode)
    end

    its(:parents) { should include other_category }

    describe "relation" do
      subject { @snode.parent_relations.where(parent_id: other_category.id) }
      it { should_not be_empty }
    end

    describe "inverse" do
      subject { other_category }
      its(:children) { should include @snode }

      describe "relation" do
        subject { other_category.child_relations.where(child_id: @snode.id) }
        it { should_not be_empty }
      end
    end
  end

  describe "children association" do
    let(:other_category) { Category.new(name: "Category") }
    before do
      @snode.children << other_category
    end

    its(:children) { should include other_category }

    describe "relation" do
      subject { @snode.child_relations.where(child_id: other_category.id) }
      it { should_not be_empty }
    end

    describe "inverse" do
      subject { other_category }
      its(:parents) { should include @snode }

      describe "relation" do
        subject { other_category.parent_relations.where(parent_id: @snode.id) }
        it { should_not be_empty }
      end
    end
  end

  describe "when node has a friend" do
    before do
      @fnode = Category.create(name: "Friend Structure Node")
      @friendship = @snode.friendships.build(:friend_id => @fnode.id)
      @friendship.save!
    end

    specify { expect(@snode.friendships.size).to eq(1) }
    specify { expect(@fnode.inverse_friendships.size).to eq(1) }
    specify { expect(@snode.friends.size).to eq(1) }
    specify { expect(@fnode.inverse_friends.size).to eq(1) }
    specify { expect(@snode.inverse_friends.size).to eq(0) }
    specify { expect(@fnode.friends.size).to eq(0) }
    specify { expect(@snode.friends[0]).to eq(@fnode) }
    specify { expect(@fnode.inverse_friends[0]).to eq(@snode) }
  end

  pending "test quiz relationships"
end
