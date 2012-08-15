require 'spec_helper'

describe "waste_captures/show" do
  before(:each) do
    @waste_capture = assign(:waste_capture, stub_model(WasteCapture,
      :user_id => 1,
      :component_id => 1,
      :workorder => "Workorder",
      :quantity => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Workorder/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
