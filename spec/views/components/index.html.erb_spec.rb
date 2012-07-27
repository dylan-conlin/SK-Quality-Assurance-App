require 'spec_helper'

describe "components/index" do
  before(:each) do
    assign(:components, [
      stub_model(Component,
        :number => "Number",
        :status => "Status",
        :sk_description => "Sk Description",
        :supplier_number => "Supplier Number",
        :minimum_po_quantity => "Minimum Po Quantity",
        :purchase_unit => "Purchase Unit",
        :stock_unit => "Stock Unit",
        :pur_stk_conversion => 1,
        :price_per_stock_unit => "9.99",
        :price_per_purchase_unit => "9.99",
        :supplier_id => 1
      ),
      stub_model(Component,
        :number => "Number",
        :status => "Status",
        :sk_description => "Sk Description",
        :supplier_number => "Supplier Number",
        :minimum_po_quantity => "Minimum Po Quantity",
        :purchase_unit => "Purchase Unit",
        :stock_unit => "Stock Unit",
        :pur_stk_conversion => 1,
        :price_per_stock_unit => "9.99",
        :price_per_purchase_unit => "9.99",
        :supplier_id => 1
      )
    ])
  end

  it "renders a list of components" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sk Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supplier Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Minimum Po Quantity".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Purchase Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Stock Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
