require 'spec_helper'

describe "progress_reports/new" do
  before(:each) do
    assign(:progress_report, stub_model(ProgressReport,
      :workorder_id => 1,
      :quantity => 1,
      :user_id => 1,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new progress_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => progress_reports_path, :method => "post" do
      assert_select "input#progress_report_workorder_id", :name => "progress_report[workorder_id]"
      assert_select "input#progress_report_quantity", :name => "progress_report[quantity]"
      assert_select "input#progress_report_user_id", :name => "progress_report[user_id]"
      assert_select "textarea#progress_report_notes", :name => "progress_report[notes]"
    end
  end
end
