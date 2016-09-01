require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class Create
  def self.token
    SecureRandom.uuid
  end
end

class User < ActiveRecord::Base
  has_many :calendars
  has_secure_password
  validates :mail, presence: true, format: {with:/.+@.+/}
  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }
end

class Calendar < ActiveRecord::Base
  belongs_to :user
end
