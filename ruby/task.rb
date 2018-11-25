class Task
  attr_accessor :assigned_id, :name, :data, :completed

  def get_owner
    Debug.debug "Attempted to execute get_owner without overriding the base clase"
  end

  def find_available_candidates
    Debug.debug "Attempted to execute find_available_candidates without overriding base class"
  end


  def initialize(name, data)
    self.name = name
    self.data = data
    self.completed = false
  end

  def execute
    Debug.debug "Attempted to execute a task that has not been defined."
  end

  def to_s
    "Completed? #{self.completed} | Owned? #{!self.assigned_id.nil?} | #{self.class.to_s}: #{self.name} | Data: #{self.data}"
  end
end
