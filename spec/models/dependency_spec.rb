require 'spec_helper'

describe Dependency do

  before do
    @dependency = Dependency.new()
    @dependency.prereq = Concept.new(name: "Addition")
    @dependency.postreq = Concept.new(name: "Subtraction")
  end

  subject { @dependency }

  it { should respond_to :prereq }
  it { should respond_to :postreq }

  it { should be_valid }

  describe "without a prereq" do
    before { @dependency.prereq = nil }
    it { should_not be_valid }
  end

  describe "without a postreq" do
    before { @dependency.postreq = nil }
    it { should_not be_valid }
  end
end
