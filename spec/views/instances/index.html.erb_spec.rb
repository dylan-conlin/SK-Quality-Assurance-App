require 'spec_helper'

describe "instances/index" do
  before(:each) do
    assign(:instances, [
      stub_model(Instance,
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
      ),
      stub_model(Instance,
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
      )
    ])
  end

  it "renders a list of instances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Workorder".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lot".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sublot".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Units".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Labor Units".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
