require 'rails_helper'

describe User do
  include TestFactories

  describe "#favorited(post)" do
    before do
      @post = post_without_user
      @user = authenticated_user
      @comment = Comment.new(body: 'My comment', post: @post, user_id:10000 )
    end
    
    it "returns `nil` if the user has not favorited the post" do
      @favorited = @user.favorited(@post)
      expect(@favorited).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      favorite = Favorite.create(post: @post, user: @user)
      expect(@user.favorited(@post)).to eq(favorite)
    end
  end  
end