require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
=begin
1 - using the let method to create a new instance of the Post class and name
it post. The let method makes the Post instance available throughout the rest of
the spec, so we only need to instantiate it once.
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}
=end
# we create a parent for post
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
# we associate post with topic with topic.posts.create! This is a chained method call
# which creates a post for a given topic
  let(:post) {topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  it {should belong_to(:topic)}

  describe "attributes" do
# 2 - we test wehther "post" has an attribute named title.  This tests whether
# post will return a non-nil value when post.title is called.
    it "should respond to title" do
      expect(post).to respond_to(:title)
    end
# 3 - we apply a similar test to the body
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end


end
