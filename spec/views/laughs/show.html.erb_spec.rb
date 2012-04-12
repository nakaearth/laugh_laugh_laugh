require 'spec_helper'

describe "laughs/show" do
  before(:each) do
    @laugh = assign(:laugh, stub_model(Laugh,
      :laugh => "MyText",
      :user_id => 1,
      :point => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
