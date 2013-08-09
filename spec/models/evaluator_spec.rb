require 'spec_helper'

describe Evaluator do

  before do
    @eval = Evaluator.new(question: "What is 2+2?", answer: "4")
    
    @cnode = ContentNode.new(name: "Test Content Node")
    @eval.content_node = @cnode

    @creator = User.new(name: "Test User")
    @eval.creator = @creator
  end

  subject { @eval }

  it { should respond_to(:content_node) }
  it { should respond_to(:creator) }
  it { should be_valid }

  describe "when doesn't belong to a content node" do
    before { @eval.content_node = nil}
    it { should_not be_valid }
  end

end
