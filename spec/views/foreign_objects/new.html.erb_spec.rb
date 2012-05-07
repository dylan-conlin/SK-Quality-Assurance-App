require 'spec_helper'

describe "foreign_objects/new" do
  before(:each) do
    assign(:foreign_object, stub_model(ForeignObject,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new foreign_object form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foreign_objects_path, :method => "post" do
      assert_select "input#foreign_object_name", :name => "foreign_object[name]"
    end
  end
end
