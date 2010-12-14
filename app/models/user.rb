class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :profile


  def name
    [profile.first_name, profile.last_name].join(' ')
  end
end
