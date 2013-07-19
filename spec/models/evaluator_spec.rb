require 'spec_helper'

describe Evaluator do

  before do
    @eval = Evaluator.new()
    @cnode = ContentNode.new(name: "Test Content Node")
    @eval.content_node = @cnode
  end

  subject { @eval }

  it { should respond_to(:content_node) }
  it { should be_valid }

  describe "when doesn't belong to a content node" do
    before { @eval.content_node = nil}
    it { should_not be_valid }
  end

end
