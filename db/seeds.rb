# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# GroupMember.destroy_all # should be destroyed via User.destroy_all

Message.destroy_all
Group.destroy_all
User.destroy_all

User.create!(username: "Zidane", phone_number: "123456", verified: true)
User.create!(username: "Modric", phone_number: "223456", verified: true)
User.create!(username: "Ronaldinho", phone_number: "22399456", verified: true)

Status.create!(user: User.first, body: "Available")
Status.create!(user: User.second, body: "Vibing")
Status.create!(user: User.third, body: "Chilling.")

Group.create!(name: "Zidane's Group", creator: User.first, dm: false)
Group.create!(creator: User.first, dm: true, dm_lookup: [User.first.id, User.second.id])
Group.create!(name: "Ron's group", dm: false, creator: User.third)

# do not add creator to group manually (autoadded in group.rb)
# do not add users to dm group manually (autoadded in group.rb)

# Group between Zidane and Modric
GroupMember.create!(user: User.second, group: Group.first)

# Big Group
GroupMember.create!(user: User.first, group: Group.third)
GroupMember.create!(user: User.second, group: Group.third)