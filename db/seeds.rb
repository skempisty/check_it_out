User.destroy_all
Post.destroy_all
Comment.delete_all

# User seed

user1 = User.create(
  email: "stephen.kempisty@email.com",
  name: "Stephen Kempisty",
  handle: "Scubasteve719",
  password: "abc123",
  password_confirmation: "abc123",
  profile_pic: File.open(File.join(Rails.root, '/app/assets/images/seed_pic1.jpg'))
)
user2 = User.create(
  email: "ariel.myren@email.com",
  name: "Ariel Myren",
  handle: "Broadwaygirl",
  password: "abc123",
  password_confirmation: "abc123",
  profile_pic: File.open(File.join(Rails.root, '/app/assets/images/trump_santa.jpg'))
)

# Post seed

user1.posts.push(
  Post.create(
    title: "Trump's chances of winning the general",
    words: "aldkfjadj falskdjflasfjlasjfljfalsdfjl"
  ),
  Post.create(
    title: "What do you guys think about Rocket League",
    words: "made a pretty sweet shot the other day"
  )
)

user2.posts.push(
  Post.create(
    title: "Troubles with getting an agent",
    words: "aldkfjadj falskdjflasfjlasjfljfalsdfjl"
  ),
  Post.create(
    title: "What's your favorite ride at Disneyland?",
    words: "lorem ipsum I like Splash mountain whatever"
  )
)

# Follow seed

user1.followers << user2

# Comment seed

comment1 = Post.first.comments.create(user: user2, words: "I didn't come here to make friends!")
comment1.comments.create(user: user1, words: "Then why did you come here?")


