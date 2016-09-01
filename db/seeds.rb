require './models.rb'

User.create(name: "Admin", user_token: SecureRandom.uuid, mail: "admin@gmail.com", administrator: true, password: "administrator", password_confirmation: "administrator")
