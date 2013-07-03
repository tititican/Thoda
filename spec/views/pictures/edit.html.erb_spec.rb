require 'spec_helper'

describe "pictures/edit" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :description => "MyString",
      :mage => "MyString",
      :project_id => 1,
      :project_token => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path(@picture), :method => "post" do
      assert_select "input#picture_description", :name => "picture[description]"
      assert_select "input#picture_mage", :name => "picture[mage]"
      assert_select "input#picture_project_id", :name => "picture[project_id]"
      assert_select "input#picture_project_token", :name => "picture[project_token]"
    end
  end
end
