require 'spec_helper'

describe "pictures/new" do
  before(:each) do
    assign(:picture, stub_model(Picture,
      :description => "MyString",
      :mage => "MyString",
      :project_id => 1,
      :project_token => "MyString"
    ).as_new_record)
  end

  it "renders new picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path, :method => "post" do
      assert_select "input#picture_description", :name => "picture[description]"
      assert_select "input#picture_mage", :name => "picture[mage]"
      assert_select "input#picture_project_id", :name => "picture[project_id]"
      assert_select "input#picture_project_token", :name => "picture[project_token]"
    end
  end
end
