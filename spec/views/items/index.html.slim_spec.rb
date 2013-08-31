require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :name => "Name"
      ),
      stub_model(Item,
        :name => "Name"
      )
    ])
    user = FactoryGirl.create(:user)
    view.stub!(:current_user).and_return(user)
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
