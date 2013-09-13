require 'spec_helper'

describe Evaluator do

  before do
    @eval = Evaluator.new(question: "What is 2+2?", answer: "4")

    @cnode = Concept.new(name: "Test Concept")
    @eval.concept = @cnode

    @creator = User.new(name: "Test User")
    @eval.creator = @creator
  end

  subject { @eval }

  it { should respond_to(:concept) }
  it { should respond_to(:creator) }
  it { should be_valid }

  describe "when doesn't belong to a concept" do
    before { @eval.concept = nil}
    it { should_not be_valid }
  end

end
