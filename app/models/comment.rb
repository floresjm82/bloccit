class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true


  after_create :send_comments_of_favorites

  private

  def send_comments_of_favorites
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
    end
  end


end
