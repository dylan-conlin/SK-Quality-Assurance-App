require 'spec_helper'

describe "progress_reports/index" do
  before(:each) do
    assign(:progress_reports, [
      stub_model(ProgressReport,
        :workorder_id => 1,
        :quantity => 1,
        :user_id => 1,
        :notes => "MyText"
      ),
      stub_model(ProgressReport,
        :workorder_id => 1,
        :quantity => 1,
        :user_id => 1,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of progress_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
