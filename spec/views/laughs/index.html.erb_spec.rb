require 'spec_helper'

describe "laughs/index" do
  before(:each) do
    assign(:laughs, [
      stub_model(Laugh,
        :laugh => "MyText",
        :user_id => 1,
        :point => 2
      ),
      stub_model(Laugh,
        :laugh => "MyText",
        :user_id => 1,
        :point => 2
      )
    ])
  end

  it "renders a list of laughs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
