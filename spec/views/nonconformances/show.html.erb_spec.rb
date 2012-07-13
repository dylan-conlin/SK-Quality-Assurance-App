require 'spec_helper'

describe "nonconformances/show" do
  before(:each) do
    @nonconformance = assign(:nonconformance, stub_model(Nonconformance,
      :user_id => 1,
      :reason => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
