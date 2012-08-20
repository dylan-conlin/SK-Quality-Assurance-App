require 'spec_helper'

describe "lines/edit" do
  before(:each) do
    @line = assign(:line, stub_model(Line,
      :number => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lines_path(@line), :method => "post" do
      assert_select "input#line_number", :name => "line[number]"
      assert_select "input#line_description", :name => "line[description]"
    end
  end
end
