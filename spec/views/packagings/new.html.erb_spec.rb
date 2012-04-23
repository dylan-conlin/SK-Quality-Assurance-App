require 'spec_helper'

describe "packagings/new" do
  before(:each) do
    assign(:packaging, stub_model(Packaging,
      :user_id => 1,
      :workorder => 1,
      :item_number => 1,
      :individual_label_placement => false,
      :individual_label_legibility => false,
      :individual_seal_integrity => false,
      :individual_label_accuracy => false,
      :individual_general_appearance => false,
      :master_label_placement => false,
      :master_label_legibility => false,
      :master_tape_glue => false,
      :master_case_appearance => false,
      :case_count => 1,
      :case_weight => "9.99",
      :comments => "MyText"
    ).as_new_record)
  end

  it "renders new packaging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => packagings_path, :method => "post" do
      assert_select "input#packaging_user_id", :name => "packaging[user_id]"
      assert_select "input#packaging_workorder", :name => "packaging[workorder]"
      assert_select "input#packaging_item_number", :name => "packaging[item_number]"
      assert_select "input#packaging_individual_label_placement", :name => "packaging[individual_label_placement]"
      assert_select "input#packaging_individual_label_legibility", :name => "packaging[individual_label_legibility]"
      assert_select "input#packaging_individual_seal_integrity", :name => "packaging[individual_seal_integrity]"
      assert_select "input#packaging_individual_label_accuracy", :name => "packaging[individual_label_accuracy]"
      assert_select "input#packaging_individual_general_appearance", :name => "packaging[individual_general_appearance]"
      assert_select "input#packaging_master_label_placement", :name => "packaging[master_label_placement]"
      assert_select "input#packaging_master_label_legibility", :name => "packaging[master_label_legibility]"
      assert_select "input#packaging_master_tape_glue", :name => "packaging[master_tape_glue]"
      assert_select "input#packaging_master_case_appearance", :name => "packaging[master_case_appearance]"
      assert_select "input#packaging_case_count", :name => "packaging[case_count]"
      assert_select "input#packaging_case_weight", :name => "packaging[case_weight]"
      assert_select "textarea#packaging_comments", :name => "packaging[comments]"
    end
  end
end
