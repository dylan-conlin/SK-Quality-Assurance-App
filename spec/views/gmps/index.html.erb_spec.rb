require 'spec_helper'

describe "gmps/index" do
  before(:each) do
    assign(:gmps, [
      stub_model(Gmp,
        :name => "Name"
      ),
      stub_model(Gmp,
        :name => "Name"
      )
    ])
  end

  it "renders a list of gmps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
