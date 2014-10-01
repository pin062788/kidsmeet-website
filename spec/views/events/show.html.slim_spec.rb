require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :category => "Category",
      :abstract => "Abstract",
      :content => "Content",
      :main_image_url => "Main Image Url",
      :apply_end_date => "",
      :apply_number_limitation => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Abstract/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Main Image Url/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
