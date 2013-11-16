require 'spec_helper'

describe CategoryFriendship do

  before do
    @friendship = CategoryFriendship.new()
    @friendship.category = Category.new(name: "Category A")
    @friendship.friend = Category.new(name: "Category B")
  end

  subject { @friendship }

  it { should respond_to :category }
  it { should respond_to :friend }

  it { should be_valid }

  describe "without a primary category" do
    before { @friendship.category = nil }
    it { should_not be_valid }
  end

  describe "without a friend category" do
    before { @friendship.friend = nil }
    it { should_not be_valid }
  end

end
