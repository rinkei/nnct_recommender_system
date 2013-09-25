require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item, :name => "Name"))
    @rating = assign(:rating, stub_model(Rating))
    @user = FactoryGirl.create(:user)
    view.stub(:current_user).and_return(@user)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
