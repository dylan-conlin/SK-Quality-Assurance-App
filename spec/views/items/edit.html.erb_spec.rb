require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :number => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_number", :name => "item[number]"
      assert_select "input#item_description", :name => "item[description]"
    end
  end
end
