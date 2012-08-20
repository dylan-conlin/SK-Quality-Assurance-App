require 'spec_helper'

describe "lines/show" do
  before(:each) do
    @line = assign(:line, stub_model(Line,
      :number => "Number",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
