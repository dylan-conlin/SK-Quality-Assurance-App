require 'spec_helper'

describe "gmps/show" do
  before(:each) do
    @gmp = assign(:gmp, stub_model(Gmp,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
