require 'spec_helper'

describe "foreign_objects/show" do
  before(:each) do
    @foreign_object = assign(:foreign_object, stub_model(ForeignObject,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
