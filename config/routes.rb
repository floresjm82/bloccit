Rails.application.routes.draw do


=begin
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'

1 - WE call the resources method and pass it a symbol...instructs Rails to
create post routes for creating, updaing, viewing, and deleting instances of Post
=end
  resources :posts, :advertisements, :questions

  
=begin

  get 'welcome/index'

  get 'welcome/about'

2 - we remove get "welcome/index" because we've declared the index view as the
root view.  We also modify the about route to allow users to type /about, rather
than /welcome/about.
=end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root({to: 'welcome#index'})
end
