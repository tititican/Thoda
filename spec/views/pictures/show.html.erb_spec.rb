require 'spec_helper'

describe "pictures/show" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :description => "Description",
      :mage => "Mage",
      :project_id => 1,
      :project_token => "Project Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Mage/)
    rendered.should match(/1/)
    rendered.should match(/Project Token/)
  end
end
