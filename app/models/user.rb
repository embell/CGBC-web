# Devise based User model. Only purpose of user is to manage content.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable

  serialize :permissions, Array

  def self.all_permissions
    [:newsletters, :sermons, :events, :articles]
  end
end
