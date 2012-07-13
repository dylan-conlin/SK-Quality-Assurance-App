require 'spec_helper'

describe "instances/new" do
  before(:each) do
    assign(:instance, stub_model(Instance,
      :nonconformance_id => 1,
      :user_id => 1,
      :workorder => "MyString",
      :lot => "MyString",
      :sublot => "MyString",
      :quantity => 1,
      :units => "MyString",
      :location => "MyString",
      :labor => 1,
      :labor_units => "MyString",
      :user_id => "MyString"
    ).as_new_record)
  end

  it "renders new instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => instances_path, :method => "post" do
      assert_select "input#instance_nonconformance_id", :name => "instance[nonconformance_id]"
      assert_select "input#instance_user_id", :name => "instance[user_id]"
      assert_select "input#instance_workorder", :name => "instance[workorder]"
      assert_select "input#instance_lot", :name => "instance[lot]"
      assert_select "input#instance_sublot", :name => "instance[sublot]"
      assert_select "input#instance_quantity", :name => "instance[quantity]"
      assert_select "input#instance_units", :name => "instance[units]"
      assert_select "input#instance_location", :name => "instance[location]"
      assert_select "input#instance_labor", :name => "instance[labor]"
      assert_select "input#instance_labor_units", :name => "instance[labor_units]"
      assert_select "input#instance_user_id", :name => "instance[user_id]"
    end
  end
end
