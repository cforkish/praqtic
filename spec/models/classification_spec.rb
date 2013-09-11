require 'spec_helper'

describe Classification do

  before do
    @classification = Classification.new()
    @classification.concept = Concept.new(name: "Addition")
    @classification.category = Category.new(name: "Arithmetic")
  end

  subject { @classification }

  it { should respond_to :concept }
  it { should respond_to :category }

  it { should be_valid }

  describe "without a concept" do
    before { @classification.concept = nil }
    it { should_not be_valid }
  end

  describe "without a category" do
    before { @classification.category = nil }
    it { should_not be_valid }
  end
end
