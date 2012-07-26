require 'spec_helper'

describe "tunneltemps/show" do
  before(:each) do
    @tunneltemp = assign(:tunneltemp, stub_model(Tunneltemp,
      :user_id => 1,
      :tunnel => "Tunnel",
      :item => "Item",
      :temperature => "9.99",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tunnel/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Item/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
