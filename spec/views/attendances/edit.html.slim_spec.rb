require 'rails_helper'

RSpec.describe "attendances/edit", :type => :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :children_number => "",
      :adults_number => ""
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input#attendance_children_number[name=?]", "attendance[children_number]"

      assert_select "input#attendance_adults_number[name=?]", "attendance[adults_number]"
    end
  end
end
