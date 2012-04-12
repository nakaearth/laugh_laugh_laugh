require 'spec_helper'

describe "laughs/edit" do
  before(:each) do
    @laugh = assign(:laugh, stub_model(Laugh,
      :laugh => "MyText",
      :user_id => 1,
      :point => 1
    ))
  end

  it "renders the edit laugh form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => laughs_path(@laugh), :method => "post" do
      assert_select "textarea#laugh_laugh", :name => "laugh[laugh]"
      assert_select "input#laugh_user_id", :name => "laugh[user_id]"
      assert_select "input#laugh_point", :name => "laugh[point]"
    end
  end
end
