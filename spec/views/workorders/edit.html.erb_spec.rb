require 'spec_helper'

describe "workorders/edit" do
  before(:each) do
    @workorder = assign(:workorder, stub_model(Workorder,
      :number => "MyString",
      :line_id => 1,
      :item_id => 1,
      :status => "MyString",
      :scheduled_quantity => 1,
      :amount_produced => 1,
      :special_equipment => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit workorder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workorders_path(@workorder), :method => "post" do
      assert_select "input#workorder_number", :name => "workorder[number]"
      assert_select "input#workorder_line_id", :name => "workorder[line_id]"
      assert_select "input#workorder_item_id", :name => "workorder[item_id]"
      assert_select "input#workorder_status", :name => "workorder[status]"
      assert_select "input#workorder_scheduled_quantity", :name => "workorder[scheduled_quantity]"
      assert_select "input#workorder_amount_produced", :name => "workorder[amount_produced]"
      assert_select "input#workorder_special_equipment", :name => "workorder[special_equipment]"
      assert_select "textarea#workorder_notes", :name => "workorder[notes]"
    end
  end
end
