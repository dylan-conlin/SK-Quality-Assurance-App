require 'spec_helper'

describe "audits/show" do
  before(:each) do
    @audit = assign(:audit, stub_model(Audit,
      :user_id => 1,
      :dishwasher => "Dishwasher",
      :cutting_tools => "Cutting Tools",
      :tunnel_temperature => "Tunnel Temperature",
      :sanitizer => "Sanitizer",
      :data_collection => "Data Collection",
      :mps => "Mps",
      :metal_detection => "Metal Detection"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dishwasher/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cutting Tools/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tunnel Temperature/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sanitizer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Data Collection/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mps/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Metal Detection/)
  end
end
