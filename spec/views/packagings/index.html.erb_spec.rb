require 'spec_helper'

describe "packagings/index" do
  before(:each) do
    assign(:packagings, [
      stub_model(Packaging,
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
      ),
      stub_model(Packaging,
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
      )
    ])
  end

  it "renders a list of packagings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
