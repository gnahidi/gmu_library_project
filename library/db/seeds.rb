# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.where(name:'Ben Lin')
    .first_or_create!(name:'Ben Lin', user_id:'test1', password_digest:'password1', admin:true)
User.where(name:'Phil Morgan')
    .first_or_create!(name:'Phil Morgan', user_id:'test2', password_digest:'password2', admin:false)
User.where(name:'Jeff Lee')
	.first_or_create!(name:'Jeff Lee', user_id:'test3', password_digest:'password3', admin:false)
