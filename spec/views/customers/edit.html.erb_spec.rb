require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :short_name => "MyString",
      :long_name => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_short_name", :name => "customer[short_name]"
      assert_select "input#customer_long_name", :name => "customer[long_name]"
    end
  end
end
