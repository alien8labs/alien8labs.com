require 'spec_helper'

describe ApplicationHelper do
  describe "#tagline" do
    it "assigns text to contend_for(:tagline)" do
      helper.should_receive(:content_for).with(:tagline)
      helper.tagline("text")
    end
  end
end
