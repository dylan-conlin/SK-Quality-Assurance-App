require 'spec_helper'

describe "instances/show" do
  before(:each) do
    @instance = assign(:instance, stub_model(Instance,
      :nonconformance_id => 1,
      :user_id => 1,
      :workorder => "Workorder",
      :lot => "Lot",
      :sublot => "Sublot",
      :quantity => 1,
      :units => "Units",
      :location => "Location",
      :labor => 1,
      :labor_units => "Labor Units",
      :user_id => "User"
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
    rendered.should match(/Lot/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sublot/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Units/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Labor Units/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
  end
end
