json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :children_number, :adults_number
  json.url attendance_url(attendance, format: :json)
end
