require 'spec_helper'

describe "watch_lists/new" do
  before(:each) do
    assign(:watch_list, stub_model(WatchList,
      :name => "MyString",
      :stocks => "MyText"
    ).as_new_record)
  end

  it "renders new watch_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => watch_lists_path, :method => "post" do
      assert_select "input#watch_list_name", :name => "watch_list[name]"
      assert_select "textarea#watch_list_stocks", :name => "watch_list[stocks]"
    end
  end
end
