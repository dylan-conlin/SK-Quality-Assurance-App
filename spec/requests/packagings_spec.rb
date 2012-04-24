require 'spec_helper'

describe "Packagings" do
  describe "GET /packagings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get packagings_path
      response.status.should be(200)
    end
  end
end
