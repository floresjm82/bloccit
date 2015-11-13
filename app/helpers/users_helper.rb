module UsersHelper

  def render_posts_for(user)
    if user.posts.any?
      render(@user.posts).html_safe
    else
      "<p>No posts have been submitted by #{user.name}</p>".html_safe
    end
  end

  def render_comments_for(user)
    if user.comments.any?
      output = "<ul>"
      user.comments.each do |comment|
        output += "<li>#{comment.body} posted on #{comment.post.title}</li>"
      end
      output += "</ul>"
      return output.html_safe
    else
      "<p>No comments have been submitted by #{user.name}</p>".html_safe
    end
  end

  def render_favorite_posts_for(user)
    if user.favorites.any?
      render(@user.favorites.collect{|favorite| favorite.post}).html_safe
    else
      "<p>#{user.name} has not favorited any posts</p>".html_safe
    end
  end


end
