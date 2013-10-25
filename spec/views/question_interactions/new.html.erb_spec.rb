require 'spec_helper'

describe "question_interactions/new" do
  before(:each) do
    assign(:question_interaction, stub_model(QuestionInteraction).as_new_record)
  end

  it "renders new question_interaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_interactions_path, "post" do
    end
  end
end
