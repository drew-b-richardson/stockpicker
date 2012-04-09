require 'spec_helper'

describe "scenarios/edit" do
  before(:each) do
    @scenario = assign(:scenario, stub_model(Scenario,
      :name => "MyString"
    ))
  end

  it "renders the edit scenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scenarios_path(@scenario), :method => "post" do
      assert_select "input#scenario_name", :name => "scenario[name]"
    end
  end
end
