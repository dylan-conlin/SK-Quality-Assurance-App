require 'spec_helper'

describe "infractions/show" do
  before(:each) do
    @infraction = assign(:infraction, stub_model(Infraction,
      :user_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
