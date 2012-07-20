require 'spec_helper'

describe "audits/index" do
  before(:each) do
    assign(:audits, [
      stub_model(Audit,
        :user_id => 1,
        :dishwasher => "Dishwasher",
        :cutting_tools => "Cutting Tools",
        :tunnel_temperature => "Tunnel Temperature",
        :sanitizer => "Sanitizer",
        :data_collection => "Data Collection",
        :mps => "Mps",
        :metal_detection => "Metal Detection"
      ),
      stub_model(Audit,
        :user_id => 1,
        :dishwasher => "Dishwasher",
        :cutting_tools => "Cutting Tools",
        :tunnel_temperature => "Tunnel Temperature",
        :sanitizer => "Sanitizer",
        :data_collection => "Data Collection",
        :mps => "Mps",
        :metal_detection => "Metal Detection"
      )
    ])
  end

  it "renders a list of audits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dishwasher".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cutting Tools".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tunnel Temperature".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sanitizer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Data Collection".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mps".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Metal Detection".to_s, :count => 2
  end
end
