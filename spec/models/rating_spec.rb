require 'spec_helper'

describe Rating do
  describe ".create_csv_header" do
    let(:header){
      header = ['Item', 'User', 'Type', 'Value']
    }

    it{ Rating.create_csv_header.should eq header }
  end
end
