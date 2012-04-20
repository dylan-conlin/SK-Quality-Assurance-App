require 'spec_helper'

describe SearchControllerController do

  describe "GET 'google_images'" do
    it "returns http success" do
      get 'google_images'
      response.should be_success
    end
  end

end
