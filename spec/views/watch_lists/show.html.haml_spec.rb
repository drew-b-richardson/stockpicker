require 'spec_helper'

describe "watch_lists/show" do
  before(:each) do
    @watch_list = assign(:watch_list, stub_model(WatchList,
      :name => "Name",
      :stocks => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
