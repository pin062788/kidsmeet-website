class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :wechat, type: String
  field :username, type: String
  field :email, type: String
  field :phone_number, type: String
  field :description, type: String

  has_and_belongs_to_many :events

  has_and_belongs_to_many :followers,
                          class_name: "User",
                          inverse_of: :following

  has_and_belongs_to_many :followings,
                          class_name: "User",
                          inverse_of: :followers


  validates :username, presence: true
  validates_uniqueness_of :phone_number, :email, :allow_blank => true
  validates :email, presence: true
  validates :phone_number, presence: true

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :multiline => true

end
