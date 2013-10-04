class CategoryFriendshipsController < ApplicationController
  skip_authorization_check #todo: i have no idea how authorization works, we need to chat. -cf

  include GraphHelper

  def new
    @jsonNodes = category_to_node(Category.first).to_json

    category = Category.find(params[:category_id])
    @friendship = category.friendships.build
  end

  def create
    category = Category.find(params[:category_id])
    friend = Category.find(params[:category_friendship][:friend])
    @friendship = CategoryFriendship.new(:category => category, :friend => friend)

    if (@friendship.save)
      flash[:success] = "Friendship created!"
      redirect_to category
    else
      render 'new'
    end
  end


  private

    def category_friendship_params
      params.require(:category_friendship).permit(:category, :friend)
    end

end
