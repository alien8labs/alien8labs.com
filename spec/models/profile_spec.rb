require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  
  it { should validate_presence_of(:first_name, :last_name) }

  it { should have_attached_file(:avatar) }
end
