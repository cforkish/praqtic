require 'spec_helper'

describe "question_interactions/edit" do
  before(:each) do
    @question_interaction = assign(:question_interaction, stub_model(QuestionInteraction))
  end

  it "renders the edit question_interaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_interaction_path(@question_interaction), "post" do
    end
  end
end
