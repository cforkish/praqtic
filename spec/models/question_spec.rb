require 'spec_helper'

describe Question do

  before do
    @eval = Question.new(question: "What is 2+2?", answer: "4")

    @cnode = Quiz.new(name: "Test Quiz")
    @eval.quiz = @cnode

    @creator = User.new(name: "Test User")
    @eval.creator = @creator
  end

  subject { @eval }

  it { should respond_to(:quiz) }
  it { should respond_to(:creator) }
  it { should be_valid }

  describe "when doesn't belong to a quiz" do
    before { @eval.quiz = nil}
    it { should_not be_valid }
  end

end
