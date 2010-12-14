class Article < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => :user_id
  has_and_belongs_to_many :tags

  validates :title,    :presence => true, :uniqueness => true
  validates :abstract, :presence => true
  validates :body,     :presence => true
  validates :user_id,  :presence => true

  scope :published,   where('published_on is not null')
  scope :unpublished, where('published_on is null')
  scope :newest,      order('published_on desc')
  scope :paginated,   lambda {|page| limit(self.per_page).offset(self.per_page * (page.to_i - 1))}
  scope :index,       lambda {|page| published.newest.paginated(page).includes(:tags, {:author => :profile}) }
end
