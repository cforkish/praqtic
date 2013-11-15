require 'spec_helper'

describe Classification do

  before do
    @category = Category.create(name: "Test Category")
    @quiz = Quiz.new(name: "Test Quiz", description: "Desc", caption: "cap")
    @classification = @quiz.classifications.build(category: @category)
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
