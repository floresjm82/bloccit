module ApplicationHelper
=begin
Methods in ApplicaitonHelper can be used across our application. Its a module
that Rails includes with other classes in our app. Any public method we write in
ApplicationHelper will be available in all views.
=end

=begin
Method that takes an array of errors and a block
the '&' turns the block into a Proc...a Proc is a block that can be reused like a variable.
The content_tag takes a symbol argument, a block, and an options hash. It then
creates the symbol-specified HTML tag with the block contents, and if specified, the options.
=end
def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def avatar_url(user)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
   end


end
