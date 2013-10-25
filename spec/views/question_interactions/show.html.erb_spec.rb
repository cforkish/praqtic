require 'spec_helper'

describe "question_interactions/show" do
  before(:each) do
    @question_interaction = assign(:question_interaction, stub_model(QuestionInteraction))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
