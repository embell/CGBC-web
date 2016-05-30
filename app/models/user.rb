class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  serialize :permissions, Array

  def self.all_permissions
    [:newsletters, :sermons, :events]
  end
end
