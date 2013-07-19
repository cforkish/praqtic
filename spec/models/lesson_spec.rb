require 'spec_helper'

describe Lesson do

  before do
    @lesson = Lesson.new(name: "Test Lesson")
    @cnode = ContentNode.new(name: "Test Content Node")
    @lesson.content_node = @cnode
  end

  subject { @lesson }

  it { should respond_to(:name) }
  it { should respond_to(:content_node) }

  it { should be_valid }

  describe "when name is not present" do
    before { @lesson.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @lesson.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when doesn't belong to a content node" do
    before { @lesson.content_node = nil}
    it { should_not be_valid }
  end

end
