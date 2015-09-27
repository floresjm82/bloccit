#Seed.rb is a script(a small utility program) we can run to seed the database with test data.

include RandomData


15.times do
  Topic.create!(

    name:  RandomData.random_sentence,
    description:   RandomData.random_paragraph
    )
end
topics = Topic.all


# Create Posts
50.times do
# 1 - adding ! instructs the method to raise an error if theres a problem with
# the data being seeded.
  Post.create!(
=begin
2 - we use methods from a class that does not exist yet, RandomData, that will
create random strings for title and body.  Writing code for classes and methods
that don't exist is known as "wishful coding" and can increase productivity
because it allows you to stay focused on one problem at a time.
=end
    topic: topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

Post.find_or_create_by(title: 'Unique Title for Post', body: 'Unique Body for Post')

posts = Post.all

50.times do
  Advertisement.create!(

    title:  RandomData.random_sentence,
    copy:   RandomData.random_paragraph,
    price:  RandomData.random_price
  )
end

50.times do
  Question.create!(

    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end



# Create Comments
#3 - this will run a given block the specified number of times...
100.times do
  Comment.create!(
=begin
4 - we call "sample" on the array returned by Post.all, in order to pick a
random post to associate each comment with. "Sample" returns a random element
from the array every time its called.
=end
  post: posts.sample,
  body: RandomData.random_paragraph

  )
end

Comment.find_or_create_by(body: 'Unique Body for Comment')



puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Topic.count} topics created"
