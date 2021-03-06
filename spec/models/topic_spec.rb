require 'rails_helper'

describe Topic do
  describe "scopes" do

    before do
      @public_topic = Topic.create
      @private_topic = Topic.create(public: false)
    end

    describe "public" do
      it "returns a relation of all public topics" do
        expect(Topic.public).to eq([@public_topic])
      end
    end

    describe "private" do
      it "returns a relation of all private topics" do
        expect(Topic.private).to eq([@private_topic])
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        expect(Topic.visible_to(true)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        expect(Topic.visible_to(false)).to eq([@public_topic])
      end
    end
  end
end