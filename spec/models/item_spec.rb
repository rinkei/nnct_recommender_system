require 'spec_helper'

describe Item do
  describe ".recommended_for(user)" do
    let(:user){ FactoryGirl.create(:user) }
    let(:item){ FactoryGirl.create(:item) }

    it { Item.recommended_for(user).should eq [item] }
  end
end
