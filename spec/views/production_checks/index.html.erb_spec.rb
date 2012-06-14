require 'spec_helper'

describe "production_checks/index" do
  before(:each) do
    assign(:production_checks, [
      stub_model(ProductionCheck,
        :user_id => 1,
        :workorder => "Workorder",
        :label_readability => false,
        :label_accuracy => false,
        :seal_integrity => false,
        :build_accuracy => false,
        :comments => "MyText"
      ),
      stub_model(ProductionCheck,
        :user_id => 1,
        :workorder => "Workorder",
        :label_readability => false,
        :label_accuracy => false,
        :seal_integrity => false,
        :build_accuracy => false,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of production_checks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Workorder".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
