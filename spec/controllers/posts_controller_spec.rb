require 'rails_helper'
include RandomData
# 6 - tells RSpec to treat the test as a controller test..allows  us to simulate controller actions
RSpec.describe PostsController, type: :controller do
# 8 - we create a post and assign it to my_post using the let...we use RandomData to
# give my_post a random title and body.
let (:my_post) {Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
# 7 - the test performs a get on the index view and expects the response to be successful.
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
=begin
9 - because our test created one post (my_post), we expect index to return an
array of one item. This achieved using assigns, a method in Action Controller::TestCase
assigns gives the test access to instance variables assiged in the action that
are available for the view.
=end
      expect(assigns(:posts)).to eq([my_post])
    end

  end
=begin
10 - we comment out the tests for show, new, and edit since we wont write the
implementation until later.
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
=end

end