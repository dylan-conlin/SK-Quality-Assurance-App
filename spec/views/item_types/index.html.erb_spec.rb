require 'spec_helper'

describe "item_types/index" do
  before(:each) do
    assign(:item_types, [
      stub_model(ItemType,
        :name => "Name"
      ),
      stub_model(ItemType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of item_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
