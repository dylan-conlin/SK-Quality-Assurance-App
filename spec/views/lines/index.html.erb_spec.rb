require 'spec_helper'

describe "lines/index" do
  before(:each) do
    assign(:lines, [
      stub_model(Line,
        :number => "Number",
        :description => "Description"
      ),
      stub_model(Line,
        :number => "Number",
        :description => "Description"
      )
    ])
  end

  it "renders a list of lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
