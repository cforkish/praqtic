require 'spec_helper'

describe Lesson do

  before do
    @lesson = Lesson.new(name: "Test Lesson")
  end

  subject { @lesson }

  it { should be_valid }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @lesson.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @lesson.name = "a" * 51 }
    it { should_not be_valid }
  end

end
