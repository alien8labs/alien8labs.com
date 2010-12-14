require 'spec_helper'

describe Tag do
  let(:tag) { Factory(:tag) }

  it { should have_and_belong_to_many(:articles) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "should use name for prints" do
    tag.to_s.should == tag.name
  end
end
