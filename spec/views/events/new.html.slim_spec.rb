require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :category => "MyString",
      :abstract => "MyString",
      :content => "MyString",
      :main_image_url => "MyString",
      :apply_end_date => "",
      :apply_number_limitation => ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_category[name=?]", "event[category]"

      assert_select "input#event_abstract[name=?]", "event[abstract]"

      assert_select "input#event_content[name=?]", "event[content]"

      assert_select "input#event_main_image_url[name=?]", "event[main_image_url]"

      assert_select "input#event_apply_end_date[name=?]", "event[apply_end_date]"

      assert_select "input#event_apply_number_limitation[name=?]", "event[apply_number_limitation]"
    end
  end
end
