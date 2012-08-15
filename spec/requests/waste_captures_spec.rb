require 'spec_helper'

describe "WasteCaptures" do
  describe "GET /waste_captures" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get waste_captures_path
      response.status.should be(200)
    end
  end
end
