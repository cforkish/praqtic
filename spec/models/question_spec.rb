require 'spec_helper'

describe Question do

  before do
    @eval = Question.new(name: "2+2", content: "What is 2+2?")

    @correct = @eval.answers.build(answer: "4", is_correct: true);
    @incorrect = @eval.answers.build(answer: "3")

    @cnode = Quiz.new(name: "Test Quiz")
    @eval.quiz = @cnode

    @creator = User.new(name: "Test User")
    @eval.creator = @creator

    @eval.save!
  end

  subject { @eval }

  specify { expect(@eval.answers.count).to eq(2) }

  it { should respond_to(:quiz) }
  it { should respond_to(:creator) }
  it { should respond_to(:answers) }
  it { should be_valid }

  describe "when doesn't belong to a quiz" do
    before { @eval.quiz = nil}
    it { should_not be_valid }
  end

  describe "when doesn't have any answers" do
    before { @eval.answers.delete_all}
    it { should_not be_valid }
  end

  describe "when doesn't have any correct answers" do
    before { @eval.answers.each { |a| a.is_correct = false } }
    it { should_not be_valid }
  end

  describe "when has more than one correct answer" do
    before { @eval.answers.each { |a| a.is_correct = true } }
    it { should_not be_valid }
  end

  describe "when only has one answer" do
    before { @eval.answers.delete(@eval.answers.first) }
    it { should_not be_valid }
  end

end
