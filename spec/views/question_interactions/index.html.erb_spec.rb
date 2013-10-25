require 'spec_helper'

describe "question_interactions/index" do
  before(:each) do
    assign(:question_interactions, [
      stub_model(QuestionInteraction),
      stub_model(QuestionInteraction)
    ])
  end

  it "renders a list of question_interactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
