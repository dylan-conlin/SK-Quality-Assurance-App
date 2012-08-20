require 'spec_helper'

describe "workorders/index" do
  before(:each) do
    assign(:workorders, [
      stub_model(Workorder,
        :number => "Number",
        :line_id => 1,
        :item_id => 1,
        :status => "Status",
        :scheduled_quantity => 1,
        :amount_produced => 1,
        :special_equipment => "Special Equipment",
        :notes => "MyText"
      ),
      stub_model(Workorder,
        :number => "Number",
        :line_id => 1,
        :item_id => 1,
        :status => "Status",
        :scheduled_quantity => 1,
        :amount_produced => 1,
        :special_equipment => "Special Equipment",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of workorders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Special Equipment".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
