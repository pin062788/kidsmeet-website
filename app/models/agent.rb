class Agent < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :events

  def has_role?(name)
    self.roles.where(name: name) .length> 0
  end

  def as_json(options = nil)
    {'id' => id,
     'name' => username,
     'email' => email }
  end
end
