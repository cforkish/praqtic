require 'spec_helper'

describe LessonInteraction do

  before do
    @interaction = LessonInteraction.new()
    @interaction.lesson = Lesson.new(name: "Test Lesson")
    @interaction.user = User.new(name: "Test User")
  end

  subject { @interaction }

  it { should respond_to :lesson }
  it { should respond_to :user }

  it { should be_valid }

  describe "without a lesson" do
    before { @interaction.lesson = nil }
    it { should_not be_valid }
  end

  describe "without a user" do
    before { @interaction.user = nil }
    it { should_not be_valid }
  end
end
