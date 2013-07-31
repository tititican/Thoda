require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "Name",
      :content => "MyText",
      :ancestry => "Ancestry"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Ancestry/)
  end
end
