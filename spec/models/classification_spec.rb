require 'spec_helper'

describe Classification do

  before do
    @classification = Classification.new()
    @classification.quiz = Quiz.new(name: "Addition")
    @classification.category = Category.new(name: "Arithmetic")
  end

  subject { @classification }

  it { should respond_to :quiz }
  it { should respond_to :category }

  it { should be_valid }

  describe "without a quiz" do
    before { @classification.quiz = nil }
    it { should_not be_valid }
  end

  describe "without a category" do
    before { @classification.category = nil }
    it { should_not be_valid }
  end
end
