class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_attached_file :avatar, :styles => {:small => '48'}, :default_url => '/images/missing/avatar_:style.png'
end
