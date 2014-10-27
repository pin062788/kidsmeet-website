require 'rails_helper'

RSpec.describe "attendances/index", :type => :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :children_number => "",
        :adults_number => ""
      ),
      Attendance.create!(
        :children_number => "",
        :adults_number => ""
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
