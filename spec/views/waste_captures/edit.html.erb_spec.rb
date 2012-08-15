require 'spec_helper'

describe "waste_captures/edit" do
  before(:each) do
    @waste_capture = assign(:waste_capture, stub_model(WasteCapture,
      :user_id => 1,
      :component_id => 1,
      :workorder => "MyString",
      :quantity => "9.99"
    ))
  end

  it "renders the edit waste_capture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => waste_captures_path(@waste_capture), :method => "post" do
      assert_select "input#waste_capture_user_id", :name => "waste_capture[user_id]"
      assert_select "input#waste_capture_component_id", :name => "waste_capture[component_id]"
      assert_select "input#waste_capture_workorder", :name => "waste_capture[workorder]"
      assert_select "input#waste_capture_quantity", :name => "waste_capture[quantity]"
    end
  end
end
