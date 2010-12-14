require 'spec_helper'

describe Article do
  before(:all) { Factory(:article) }

  it { should belong_to(:author, :class_name => 'User', :foreign_key => :user_id) }
  it { should have_and_belong_to_many(:tags) }

  it { should validate_presence_of(:title, :abstract, :body, :user_id) }
  it { should validate_uniqueness_of(:title) }

  # TODO: have_scope is being a bitch and these should really test for conditions
  #
  # it { should have_scope(:published) }
  # it { should have_scope(:unpublished) }
  # it { should have_scope(:newest) }
  # it { should have_scope(:paginated, :with => 5) }
  # it { should have_scope(:index, :with => 5) }
end
