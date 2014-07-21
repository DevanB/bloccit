class FavoriteMailer < ActionMailer::Base
  default from: "devan@devanb.us"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@devanb-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@devanb-bloccit.example>"
    headers["References"] = "<post/#{post.id}@devanb-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
