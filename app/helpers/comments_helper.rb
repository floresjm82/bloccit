module CommentsHelper

  def user_is_authorized_for_comment?(comment)
     current_user && (current_user == comment.user || current_user.admin?)
  end

  def profile_comments? (comment)
    current_user.comments.count >= 1
  end

end
