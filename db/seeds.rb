# This file should contain all record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if Rails.env = 'development'
  # Create sample users
  User.create(email: 'test@example.com', password: '12345678',
              password_confirmation: '12345678',
              permissions: User.all_permissions)

  User.create(email: 'news@example.com', password: '12345678',
              password_confirmation: '12345678',
              permissions: [:newsletters])

  User.create(email: 'sermons@example.com', password: '12345678',
              password_confirmation: '12345678',
              permissions: [:sermons])

  User.create(email: 'articles@example.com', password: '12345678',
              password_confirmation: '12345678',
              permissions: [:articles])

  User.create(email: 'news.events@example.com', password: '12345678',
              password_confirmation: '12345678',
              permissions: [:newsletters, :events])

  # Sample events
  Event.create(name: 'Sample event 1', start_date: Date.today + 3, 
               description: 'This is the first test event.')
  Event.create(name: 'Sample event 2', start_date: Date.today + 8)
  Event.create(name: 'Sample event 3', start_date: Date.today + 11, 
               end_date: Date.today + 16, description: 'This is another test event')
end
