# This file should contain all record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if Rails.env = 'development' 
  User.create({email: 'test@example.com', password: '12345678', password_confirmation: '12345678'})
end
