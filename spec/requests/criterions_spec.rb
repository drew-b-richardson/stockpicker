require 'spec_helper'

describe "Criterions" do
  describe "GET /criterions" do
    it "works! " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get criterions_path
      response.status.should be(200)
    end
    it "should have 'criterions' in the title" do
      visit criterions_path
      page.should have_selector('title', :text => 'Criterions') 
    end
     
  end
end
