require 'spec_helper'

describe "gmps/edit" do
  before(:each) do
    @gmp = assign(:gmp, stub_model(Gmp,
      :name => "MyString"
    ))
  end

  it "renders the edit gmp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gmps_path(@gmp), :method => "post" do
      assert_select "input#gmp_name", :name => "gmp[name]"
    end
  end
end
