require 'rails_helper'

describe Post do
  describe "vote methods" do

    before do
      @user = User.new(id: 1, email: "test@test.com", password: "12345678")
      @user.skip_confirmation!
      @user.save
      @topic = Topic.create(description: "Topic title Is here")
      @post = Post.create(title: "Post title", body: "Post bodies must be pretty long.", user_id: 1, topic_id: 1)
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect( @post.up_votes ).to eq(3)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect( @post.down_votes ).to eq(2)
      end
    end

    describe "#points" do
      it "returns the sume of all down and up votes" do
        expect( @post.points ).to eq(1) # 3 - 2
      end
    end
  end
end