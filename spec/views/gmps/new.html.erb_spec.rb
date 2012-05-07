require 'spec_helper'

describe "gmps/new" do
  before(:each) do
    assign(:gmp, stub_model(Gmp,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new gmp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gmps_path, :method => "post" do
      assert_select "input#gmp_name", :name => "gmp[name]"
    end
  end
end
