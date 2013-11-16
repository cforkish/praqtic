class GraphController < ApplicationController
  skip_authorization_check

  include GraphHelper

  def index
    @jsonNodes = category_to_node(Category.first).to_json
  end
end