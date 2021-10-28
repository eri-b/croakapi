# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Group.destroy_all
# GroupMember.destroy_all # should be destroyed via User.destroy_all
Message.destroy_all

User.create(username: "Zidane", phone_number: "123456", verified: true)
User.create(username: "Modric", phone_number: "223456", verified: true)
User.create(username: "Ronaldinho", phone_number: "223456", verified: true)

Group.create(name: "Zidane's Group", creator_id: 1, dm: false)
Group.create(creator_id: 1, dm: true)
Group.create(name: "Ron's group", creator_id: 3)

# Group between Zidane and Modric
GroupMember.create(user_id: 1, group_id: 1)
GroupMember.create(user_id: 2, group_id: 1)

# DM between Zidane and Modric
GroupMember.create(user_id: 1, group_id: 2)
GroupMember.create(user_id: 2, group_id: 2)

# Big Group
GroupMember.create(user_id: 1, group_id: 3)
GroupMember.create(user_id: 2, group_id: 3)
GroupMember.create(user_id: 3, group_id: 3)


