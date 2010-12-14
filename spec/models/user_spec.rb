require 'spec_helper'

describe User do
  it { should have_one(:profile) }

  describe "#name" do
    let(:user) { Factory(:user) }
    specify { user.name.should == [user.profile.first_name, user.profile.last_name].join(' ') }
  end
end
