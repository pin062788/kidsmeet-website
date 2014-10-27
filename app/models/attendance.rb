class Attendance
  include Mongoid::Document

  field :children_number, type: Integer
  field :adults_number, type: Integer

  belongs_to :event
  belongs_to :user

end
