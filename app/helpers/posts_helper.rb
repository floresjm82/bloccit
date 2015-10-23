module PostsHelper

  def user_is_authorized_to_delete_post?(post)
    if current_user.moderator? == false
      current_user && (current_user == post.user  || current_user.admin?)
    end
  end

  def user_is_authorized_to_edit_post?(post)
    current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
  end

end
