require 'spec_helper'

describe "watch_lists/index" do
  before(:each) do
    assign(:watch_lists, [
      stub_model(WatchList,
        :name => "Name",
        :stocks => "MyText"
      ),
      stub_model(WatchList,
        :name => "Name",
        :stocks => "MyText"
      )
    ])
  end

  it "renders a list of watch_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
