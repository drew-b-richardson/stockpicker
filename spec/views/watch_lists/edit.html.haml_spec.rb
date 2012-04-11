require 'spec_helper'

describe "watch_lists/edit" do
  before(:each) do
    @watch_list = assign(:watch_list, stub_model(WatchList,
      :name => "MyString",
      :stocks => "MyText"
    ))
  end

  it "renders the edit watch_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => watch_lists_path(@watch_list), :method => "post" do
      assert_select "input#watch_list_name", :name => "watch_list[name]"
      assert_select "textarea#watch_list_stocks", :name => "watch_list[stocks]"
    end
  end
end
