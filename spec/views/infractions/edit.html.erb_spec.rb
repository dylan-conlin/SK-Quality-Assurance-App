require 'spec_helper'

describe "infractions/edit" do
  before(:each) do
    @infraction = assign(:infraction, stub_model(Infraction,
      :user_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit infraction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => infractions_path(@infraction), :method => "post" do
      assert_select "input#infraction_user_id", :name => "infraction[user_id]"
      assert_select "textarea#infraction_description", :name => "infraction[description]"
    end
  end
end
