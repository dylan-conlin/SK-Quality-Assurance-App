require 'spec_helper'

describe "lines/new" do
  before(:each) do
    assign(:line, stub_model(Line,
      :number => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lines_path, :method => "post" do
      assert_select "input#line_number", :name => "line[number]"
      assert_select "input#line_description", :name => "line[description]"
    end
  end
end
