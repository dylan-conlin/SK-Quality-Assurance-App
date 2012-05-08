require 'spec_helper'

describe "issues/new" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :department_id => 1,
      :gmp_id => 1,
      :user_id => 1,
      :description => "MyText",
      :workorder => 1,
      :foreign_object_id => 1
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => issues_path, :method => "post" do
      assert_select "input#issue_department_id", :name => "issue[department_id]"
      assert_select "input#issue_gmp_id", :name => "issue[gmp_id]"
      assert_select "input#issue_user_id", :name => "issue[user_id]"
      assert_select "textarea#issue_description", :name => "issue[description]"
      assert_select "input#issue_workorder", :name => "issue[workorder]"
      assert_select "input#issue_foreign_object_id", :name => "issue[foreign_object_id]"
    end
  end
end
