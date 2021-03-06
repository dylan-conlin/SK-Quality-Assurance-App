require 'spec_helper'

describe "nonconformances/new" do
  before(:each) do
    assign(:nonconformance, stub_model(Nonconformance,
      :user_id => 1,
      :reason => "MyText"
    ).as_new_record)
  end

  it "renders new nonconformance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nonconformances_path, :method => "post" do
      assert_select "input#nonconformance_user_id", :name => "nonconformance[user_id]"
      assert_select "textarea#nonconformance_reason", :name => "nonconformance[reason]"
    end
  end
end
