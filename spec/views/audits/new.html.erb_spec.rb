require 'spec_helper'

describe "audits/new" do
  before(:each) do
    assign(:audit, stub_model(Audit,
      :user_id => 1,
      :dishwasher => "MyString",
      :cutting_tools => "MyString",
      :tunnel_temperature => "MyString",
      :sanitizer => "MyString",
      :data_collection => "MyString",
      :mps => "MyString",
      :metal_detection => "MyString"
    ).as_new_record)
  end

  it "renders new audit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => audits_path, :method => "post" do
      assert_select "input#audit_user_id", :name => "audit[user_id]"
      assert_select "input#audit_dishwasher", :name => "audit[dishwasher]"
      assert_select "input#audit_cutting_tools", :name => "audit[cutting_tools]"
      assert_select "input#audit_tunnel_temperature", :name => "audit[tunnel_temperature]"
      assert_select "input#audit_sanitizer", :name => "audit[sanitizer]"
      assert_select "input#audit_data_collection", :name => "audit[data_collection]"
      assert_select "input#audit_mps", :name => "audit[mps]"
      assert_select "input#audit_metal_detection", :name => "audit[metal_detection]"
    end
  end
end
