json.array!(@events) do |event|
  json.extract! event, :id, :title, :category, :abstract, :content, :main_image_url, :apply_end_date, :apply_number_limitation
  json.url event_url(event, format: :json)
end
