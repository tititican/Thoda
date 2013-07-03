require 'spec_helper'

describe "pictures/index" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture,
        :description => "Description",
        :mage => "Mage",
        :project_id => 1,
        :project_token => "Project Token"
      ),
      stub_model(Picture,
        :description => "Description",
        :mage => "Mage",
        :project_id => 1,
        :project_token => "Project Token"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Mage".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Project Token".to_s, :count => 2
  end
end
