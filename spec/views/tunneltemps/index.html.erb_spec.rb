require 'spec_helper'

describe "tunneltemps/index" do
  before(:each) do
    assign(:tunneltemps, [
      stub_model(Tunneltemp,
        :user_id => 1,
        :tunnel => "Tunnel",
        :item => "Item",
        :temperature => "9.99",
        :description => "MyText"
      ),
      stub_model(Tunneltemp,
        :user_id => 1,
        :tunnel => "Tunnel",
        :item => "Item",
        :temperature => "9.99",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tunneltemps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tunnel".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
