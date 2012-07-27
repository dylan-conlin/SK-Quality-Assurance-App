require 'spec_helper'

describe "components/show" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sk Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Supplier Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Minimum Po Quantity/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Purchase Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Stock Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
