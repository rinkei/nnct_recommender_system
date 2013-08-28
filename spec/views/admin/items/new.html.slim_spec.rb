require 'spec_helper'

describe "admin/items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_items_path, "post" do
      assert_select "input#item_name[name=?]", "item[name]"
    end
  end
end
