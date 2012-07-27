require 'spec_helper'

describe "components/edit" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :number => "MyString",
      :status => "MyString",
      :sk_description => "MyString",
      :supplier_number => "MyString",
      :minimum_po_quantity => "MyString",
      :purchase_unit => "MyString",
      :stock_unit => "MyString",
      :pur_stk_conversion => 1,
      :price_per_stock_unit => "9.99",
      :price_per_purchase_unit => "9.99",
      :supplier_id => 1
    ))
  end

  it "renders the edit component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => components_path(@component), :method => "post" do
      assert_select "input#component_number", :name => "component[number]"
      assert_select "input#component_status", :name => "component[status]"
      assert_select "input#component_sk_description", :name => "component[sk_description]"
      assert_select "input#component_supplier_number", :name => "component[supplier_number]"
      assert_select "input#component_minimum_po_quantity", :name => "component[minimum_po_quantity]"
      assert_select "input#component_purchase_unit", :name => "component[purchase_unit]"
      assert_select "input#component_stock_unit", :name => "component[stock_unit]"
      assert_select "input#component_pur_stk_conversion", :name => "component[pur_stk_conversion]"
      assert_select "input#component_price_per_stock_unit", :name => "component[price_per_stock_unit]"
      assert_select "input#component_price_per_purchase_unit", :name => "component[price_per_purchase_unit]"
      assert_select "input#component_supplier_id", :name => "component[supplier_id]"
    end
  end
end
