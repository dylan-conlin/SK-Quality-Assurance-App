require 'spec_helper'

describe "tunneltemps/new" do
  before(:each) do
    assign(:tunneltemp, stub_model(Tunneltemp,
      :user_id => 1,
      :tunnel => "MyString",
      :item => "MyString",
      :temperature => "9.99",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new tunneltemp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tunneltemps_path, :method => "post" do
      assert_select "input#tunneltemp_user_id", :name => "tunneltemp[user_id]"
      assert_select "input#tunneltemp_tunnel", :name => "tunneltemp[tunnel]"
      assert_select "input#tunneltemp_item", :name => "tunneltemp[item]"
      assert_select "input#tunneltemp_temperature", :name => "tunneltemp[temperature]"
      assert_select "textarea#tunneltemp_description", :name => "tunneltemp[description]"
    end
  end
end
