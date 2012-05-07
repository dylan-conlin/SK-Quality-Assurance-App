require 'spec_helper'

describe "foreign_objects/edit" do
  before(:each) do
    @foreign_object = assign(:foreign_object, stub_model(ForeignObject,
      :name => "MyString"
    ))
  end

  it "renders the edit foreign_object form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foreign_objects_path(@foreign_object), :method => "post" do
      assert_select "input#foreign_object_name", :name => "foreign_object[name]"
    end
  end
end
