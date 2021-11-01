# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# GroupMember.destroy_all # should be destroyed via User.destroy_all

Message.destroy_all
DmMember.destroy_all
Group.destroy_all
User.destroy_all

User.create(username: "Zidane", phone_number: "123456", verified: true)
User.create(username: "Modric", phone_number: "223456", verified: true)
User.create(username: "Ronaldinho", phone_number: "223456", verified: true)

Group.create(name: "Zidane's Group", creator: User.first, dm: false)
Group.create(creator: User.first, dm: true, dm_lookup: [User.first.id, User.second.id])
Group.create(name: "Ron's group", dm: false, creator_id: User.third)

# Group between Zidane and Modric
GroupMember.create(user: User.first, group: Group.first)
GroupMember.create(user: User.second, group: Group.first)

# DM between Zidane and Modric
GroupMember.create(user: User.first, group: Group.second)
GroupMember.create(user: User.second, group: Group.second)

DmMember.create(dm_member1: User.first, dm_member2: User.second, group: Group.second)

# Big Group
GroupMember.create(user: User.first, group: Group.third)
GroupMember.create(user: User.second, group: Group.third)
GroupMember.create(user: User.third, group: Group.third)


