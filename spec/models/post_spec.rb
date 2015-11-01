require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
=begin
1 - using the let method to create a new instance of the Post class and name
it post. The let method makes the Post instance available throughout the rest of
the spec, so we only need to instantiate it once.
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}
=end
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}

  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

# we associate post with topic with topic.posts.create! This is a chained method call
# which creates a post for a given topic
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }

  it { should have_many(:comments)}
  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }
  it { should have_many(:votes) }

  it { should belong_to(:topic)}
  it { should belong_to(:user)}

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:user) }

  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:body).is_at_least(20) }

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

  describe "voting" do
   # #5
       before do
         3.times { post.votes.create!(value: 1) }
         2.times { post.votes.create!(value: -1) }
         @up_votes = post.votes.where(value: 1).count
         @down_votes = post.votes.where(value: -1).count
       end

       describe "#up_votes" do
         it "counts the number of votes with value = 1" do
           expect( post.up_votes ).to eq(@up_votes)
         end
       end

       describe "#down_votes" do
         it "counts the number of votes with value = -1" do
           expect( post.down_votes ).to eq(@down_votes)
         end
       end

       describe "#points" do
         it "returns the sum of all down and up votes" do
           expect( post.points ).to eq(@up_votes - @down_votes)
         end
       end
       
     end

     describe "#update_rank" do
       it "calculates the correct rank" do
         post.update_rank
         expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
       end

       it "updates the rank when an up vote is created" do
         old_rank = post.rank
         post.votes.create!(value: 1)
         expect(post.rank).to eq (old_rank + 1)
       end

       it "updates the rank when a down vote is created" do
         old_rank = post.rank
         post.votes.create!(value: -1)
         expect(post.rank).to eq (old_rank - 1)
       end
     end


end
