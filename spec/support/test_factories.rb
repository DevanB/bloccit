module TestFactories
  def post_without_user(options={})
    post_options = {title: "Post title", body: "Post bodies must be pretty long."}.merge(options)
    post = Post.new(post_options)
    allow(post).to receive(:create_vote)
    post.save
    post
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  def comment_without_email(options={})
    comment_options = {body: "A Comment"}.merge(options)
    comment = Comment.new(comment_options)
    allow(comment).to receive(:send_favorite_emails)
    comment.save
    comment
  end
end