require 'spec_helper'

describe "nonconformances/index" do
  before(:each) do
    assign(:nonconformances, [
      stub_model(Nonconformance,
        :user_id => 1,
        :reason => "MyText"
      ),
      stub_model(Nonconformance,
        :user_id => 1,
        :reason => "MyText"
      )
    ])
  end

  it "renders a list of nonconformances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
