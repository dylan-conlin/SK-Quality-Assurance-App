require 'spec_helper'

describe "foreign_objects/index" do
  before(:each) do
    assign(:foreign_objects, [
      stub_model(ForeignObject,
        :name => "Name"
      ),
      stub_model(ForeignObject,
        :name => "Name"
      )
    ])
  end

  it "renders a list of foreign_objects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
