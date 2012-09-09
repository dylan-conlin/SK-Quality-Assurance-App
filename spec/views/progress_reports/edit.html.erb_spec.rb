require 'spec_helper'

describe "progress_reports/edit" do
  before(:each) do
    @progress_report = assign(:progress_report, stub_model(ProgressReport,
      :workorder_id => 1,
      :quantity => 1,
      :user_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit progress_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => progress_reports_path(@progress_report), :method => "post" do
      assert_select "input#progress_report_workorder_id", :name => "progress_report[workorder_id]"
      assert_select "input#progress_report_quantity", :name => "progress_report[quantity]"
      assert_select "input#progress_report_user_id", :name => "progress_report[user_id]"
      assert_select "textarea#progress_report_notes", :name => "progress_report[notes]"
    end
  end
end
