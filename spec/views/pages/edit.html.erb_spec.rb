require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText",
      :ancestry => "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path(@page), :method => "post" do
      assert_select "input#page_name", :name => "page[name]"
      assert_select "textarea#page_content", :name => "page[content]"
      assert_select "input#page_ancestry", :name => "page[ancestry]"
    end
  end
end
