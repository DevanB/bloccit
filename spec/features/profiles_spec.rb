require 'rails_helper'

describe "Visiting profiles" do
  include TestFactories
  include Warden::Test::Helpers

  before do
    Warden.test_mode!
    @admin = authenticated_user(role: 'admin')
    @user = authenticated_user
    @topic = Topic.create(description: "A topic")
    @post = post_without_user(user: @user, topic: @topic)
    @comment = comment_without_email(user: @user, post: @post)
  end

  describe "not signed in" do
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end

  describe "signed in" do
    it "shows profile" do
      login_as(@admin, scope: :user)
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end
end