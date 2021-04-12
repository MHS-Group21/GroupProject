# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# updated
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

users = User.create([
  {email: 'james@mhs.org', username: 'James', password: 'password'},
  {email: 'felicia@mhs.org', username: 'Felicia', password: 'password'},
  {email: 'mayu@mhs.org', username: 'Mayu', password: 'password', volunteer: true},
  {email: 'aron@mhs.org', username: 'Aron', password: 'password'},
  {email: 'jake@mhs.org', username: 'Jake', password: 'password'},
  {email: 'niall@mhs.org', username: 'Niall', password: 'password'}
  ])

  users[0].add_role :admin
  users[1].add_role :admin
  users[4].add_role :admin

channels = Channel.create([
  {name: 'Physical Fitness'},
  {name: 'Depression'},
  {name: 'Anxiety'},
  {name: 'Loneliness'},
  {name: 'Stress'}
  ])

discussions = Discussion.create([
  {title: 'Dog walks for mental Health', user: users[0], channel: channels[0], content: "Heading out for regular walks with our dogs provides great physical and mental health benefits; it's been shown to ease feelings of loneliness, anxiety, depression and stress. Understanding the health benefits of a good dog walk can help us appreciate how much our pets mean to us."},
  {title: 'Little steps', user: users[1], channel: channels[1], content: "When coping with depression it can be hard to get out of bed sometimes. But setting small achievable such as getting out of bed or tidying your room can be a great first step in helping to put us in a positive mindset"},
  {title: 'Grouding Techniques', user: users[2], channel: channels[2], content: "5: Acknowledge FIVE things you see around you\n4: Acknowledge FOUR things you can touch around you.\n3: Acknowledge THREE things you hear.\n2: Acknowledge TWO things you can smell.\n1: Acknowledge ONE thing you can taste."},
  {title: 'Community Service ', user: users[3], channel: channels[3], content: "Consider community service or another activity that you enjoy. These situations present great opportunities to meet people and cultivate new friendships and social interactions."},
  {title: 'Meditation', user: users[4], channel: channels[4], content: "Meditation is one effective method we can use to combat stress. A simple and easy to follow form of meditation is to simple focus on your breath. This can be done whilst sitting or lying down (whichever is more comfortable), or even on a walk. Doing this for 10-15 minutes a day can help you to detress."}
  ])

  replies = Reply.create([
    {discussion: discussions[0], user: users[0], reply_text: "Yes OMG I love dogs "},
    {discussion: discussions[0], user: users[1], reply_text: "I'm more of a cat person"},
    {discussion: discussions[1], user: users[2], reply_text: "First"},
    {discussion: discussions[1], user: users[3], reply_text: "Depression is pretty gay ngl"},
    {discussion: discussions[1], user: users[4], reply_text: "Woah that's kinda homophobic"},
    {discussion: discussions[2], user: users[5], reply_text: "Thanks this really helped"},
    {discussion: discussions[3], user: users[0], reply_text: "This is difficult to do during the pandemic unforntunately"},
    {discussion: discussions[4], user: users[1], reply_text: "This was super helpful."},
    ])

  discussion_reports = DiscussionReport.create([
    {discussion: discussions[0], review_status: 0}
    ])

  reply_reports = ReplyReport.create([
    {reply: replies[3], review_status: 1},
    {reply: replies[2], review_status: 0}
    ])
