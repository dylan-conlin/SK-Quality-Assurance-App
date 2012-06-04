require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :short_name => "Short Name",
      :long_name => "Long Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Long Name/)
  end
end
