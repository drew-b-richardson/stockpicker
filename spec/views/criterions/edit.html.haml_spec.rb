require 'spec_helper'

describe "criterions/edit" do
  before(:each) do
    @criterion = assign(:criterion, stub_model(Criterion,
      :name => "MyString",
      :url => "MyString",
      :xpath => "MyString"
    ))
  end

  it "renders the edit criterion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => criterions_path(@criterion), :method => "post" do
      assert_select "input#criterion_name", :name => "criterion[name]"
      assert_select "input#criterion_url", :name => "criterion[url]"
      assert_select "input#criterion_xpath", :name => "criterion[xpath]"
    end
  end
end
