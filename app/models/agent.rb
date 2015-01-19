class Agent < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :events

  #has_many :histories, -> { where( end_time < Time.new).order('id desc').limit(5) }, class_name: "Event"
  #has_many :upcomings, -> { where( end_time > Time.new).order('id desc').limit(5) }, class_name: "Event"

  def has_role?(name)
    self.roles.where(name: name).length> 0
  end

  def as_json(options = nil)

    {'id' => id,
     'name' => username,
     'email' => email }.as_json(include: [:events]).to_json
  end

end
