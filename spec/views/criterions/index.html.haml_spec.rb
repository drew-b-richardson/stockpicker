require 'spec_helper'

describe "criterions/index" do
  before(:each) do
    assign(:criterions, [
      stub_model(Criterion,
        :name => "Name",
        :url => "Url",
        :xpath => "Xpath"
      ),
      stub_model(Criterion,
        :name => "Name",
        :url => "Url",
        :xpath => "Xpath"
      )
    ])
  end

  it "renders a list of criterions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Xpath".to_s, :count => 2
  end
end
