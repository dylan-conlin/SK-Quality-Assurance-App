require 'spec_helper'

describe "production_checks/edit" do
  before(:each) do
    @production_check = assign(:production_check, stub_model(ProductionCheck,
      :user_id => 1,
      :workorder => "MyString",
      :label_readability => false,
      :label_accuracy => false,
      :seal_integrity => false,
      :build_accuracy => false,
      :comments => "MyText"
    ))
  end

  it "renders the edit production_check form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => production_checks_path(@production_check), :method => "post" do
      assert_select "input#production_check_user_id", :name => "production_check[user_id]"
      assert_select "input#production_check_workorder", :name => "production_check[workorder]"
      assert_select "input#production_check_label_readability", :name => "production_check[label_readability]"
      assert_select "input#production_check_label_accuracy", :name => "production_check[label_accuracy]"
      assert_select "input#production_check_seal_integrity", :name => "production_check[seal_integrity]"
      assert_select "input#production_check_build_accuracy", :name => "production_check[build_accuracy]"
      assert_select "textarea#production_check_comments", :name => "production_check[comments]"
    end
  end
end
