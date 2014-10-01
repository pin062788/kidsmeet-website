require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :category => "Category",
        :abstract => "Abstract",
        :content => "Content",
        :main_image_url => "Main Image Url",
        :apply_end_date => "",
        :apply_number_limitation => ""
      ),
      Event.create!(
        :title => "Title",
        :category => "Category",
        :abstract => "Abstract",
        :content => "Content",
        :main_image_url => "Main Image Url",
        :apply_end_date => "",
        :apply_number_limitation => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Abstract".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Main Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
