class Attendance
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :children_number, type: Integer
  field :adults_number, type: Integer

  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true

end
