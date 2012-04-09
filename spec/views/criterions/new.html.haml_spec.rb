require 'spec_helper'

describe "criterions/new" do
  before(:each) do
    assign(:criterion, stub_model(Criterion,
      :name => "MyString",
      :url => "MyString",
      :xpath => "MyString"
    ).as_new_record)
  end

  it "renders new criterion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => criterions_path, :method => "post" do
      assert_select "input#criterion_name", :name => "criterion[name]"
      assert_select "input#criterion_url", :name => "criterion[url]"
      assert_select "input#criterion_xpath", :name => "criterion[xpath]"
    end
  end
end
