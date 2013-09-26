require 'spec_helper'

describe RatingsHelper do
  describe "rating_score_means" do
    it "returns array" do
      helper.rating_score_means.should be_an_instance_of(Array)
    end
  end
end
