require 'spec_helper'

describe "waste_captures/index" do
  before(:each) do
    assign(:waste_captures, [
      stub_model(WasteCapture,
        :user_id => 1,
        :component_id => 1,
        :workorder => "Workorder",
        :quantity => "9.99"
      ),
      stub_model(WasteCapture,
        :user_id => 1,
        :component_id => 1,
        :workorder => "Workorder",
        :quantity => "9.99"
      )
    ])
  end

  it "renders a list of waste_captures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Workorder".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
