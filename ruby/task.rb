class Task
  attr_accessor :assigned_obj, :assigned_id, :name, :data, :completed

  def initialize(name, data)
    self.name = name
    self.data = data
    self.completed = false
  end

  def execute(owner)
    Debug.debug "Attempted to execute a task that has not been defined."
  end

  def to_s
    "#{self.class.to_s}: #{self.name} | Data: #{self.data}"
  end
end
