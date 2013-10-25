require "spec_helper"

describe QuestionInteractionsController do
  describe "routing" do

    it "routes to #index" do
      get("/question_interactions").should route_to("question_interactions#index")
    end

    it "routes to #new" do
      get("/question_interactions/new").should route_to("question_interactions#new")
    end

    it "routes to #show" do
      get("/question_interactions/1").should route_to("question_interactions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_interactions/1/edit").should route_to("question_interactions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_interactions").should route_to("question_interactions#create")
    end

    it "routes to #update" do
      put("/question_interactions/1").should route_to("question_interactions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_interactions/1").should route_to("question_interactions#destroy", :id => "1")
    end

  end
end
