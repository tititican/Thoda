require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :activitives => "MyString",
      :location => "MyString",
      :desciption => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_activitives", :name => "project[activitives]"
      assert_select "input#project_location", :name => "project[location]"
      assert_select "textarea#project_desciption", :name => "project[desciption]"
    end
  end
end
