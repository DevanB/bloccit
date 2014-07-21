class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true

  after_create :send_favorite_emails

  private

  def send_favorite_emails
    post.favorites.each do |favorites|
      FavoriteMailer.new_comment(favorites.user, post, self).deliver
    end
  end
end
