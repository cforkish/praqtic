require 'spec_helper'

describe LessonInteraction do

  before do
    @interaction = LessonInteraction.new()
    @lesson = Lesson.new(name: "Test Lesson")
    @user = User.new(name: "Test User")
    @interaction.lesson = @lesson
    @interaction.user = @user
  end

  subject { @interaction }

  it { should respond_to(:lesson) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when doesn't belong to a lesson" do
    before do
      @interaction.lesson = nil
    end

    it { should_not be_valid }
  end

  describe "when doesn't belong to a user" do
    before do
      @interaction.user = nil
    end

    it { should_not be_valid }
  end

end
