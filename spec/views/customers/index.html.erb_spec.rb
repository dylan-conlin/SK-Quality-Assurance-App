require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :short_name => "Short Name",
        :long_name => "Long Name"
      ),
      stub_model(Customer,
        :short_name => "Short Name",
        :long_name => "Long Name"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Long Name".to_s, :count => 2
  end
end
