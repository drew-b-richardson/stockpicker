require 'spec_helper'

describe "criterions/show" do
  before(:each) do
    @criterion = assign(:criterion, stub_model(Criterion,
      :name => "Name",
      :url => "Url",
      :xpath => "Xpath"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Xpath/)
  end
end
