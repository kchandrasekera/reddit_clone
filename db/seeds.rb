# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.create(body: "first top level comment", link_id: 1, user_id: 1)

Comment.create(body: "one level deep", link_id: 1, user_id: 1, parent_comment_id: 1)

Comment.create(body: "two levels deep", link_id: 1, user_id: 1, parent_comment_id: 2)

Comment.create(body: "three levels deep", link_id: 1, user_id: 1, parent_comment_id: 2)

Comment.create(body: "second top level comment", link_id: 1, user_id: 1)

Comment.create(body: "one level deep", link_id: 1, user_id: 1, parent_comment_id: 5)

Comment.create(body: "two levels deep", link_id: 1, user_id: 1, parent_comment_id: 6)

Comment.create(body: "three levels deep", link_id: 1, user_id: 1, parent_comment_id: 7)


