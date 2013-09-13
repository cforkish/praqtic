class CategoryFriendshipsController < ApplicationController
  def new
    @jsonNodes = category_to_node(Category.first).to_json
  end

  def create
  end
end
