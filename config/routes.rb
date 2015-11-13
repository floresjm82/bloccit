Rails.application.routes.draw do

#  resources :ratings, only: [:show]
  resources :labels, only: [:show]
  resources :advertisements, :questions
  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts, except: [:index]
   end
# we use only [] becase we don't want to create any /posts/:id routes, just
# posts/:post_id/comments routes
   resources :posts, only: [] do
# don't need new or index routes as comments are displayed on the posts show view
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
   end




# we create routes for new and create actions...only hash key will preven Rails
# from creating unnecessary routes.
  resources :users, only: [:new, :create, :show]
    post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]

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
