require 'spec_helper'

describe ContentNode do

  before do
    @cnode = ContentNode.new(name: "Test Content Node")
  end

  subject { @cnode }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @cnode.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @cnode.name = "a" * 51 }
    it { should_not be_valid }
  end

end
