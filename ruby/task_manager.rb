class TaskManager
  attr_accessor :tasks

  def self.shared
    @@manager ||= self.new
  end

  def initialize
    self.tasks = []
  end

  def add_task(task, duplicates_allowed = 1)
    Debug.debug "TaskManager: Adding task: #{task}"

    desired_tasks = self.tasks.select {|t| t.name == task.name} || []

    Debug.debug "desired_tasks: #{desired_tasks.length} | duplicates_allowed: #{duplicates_allowed}"
    if duplicates_allowed >= 1 && desired_tasks.length < duplicates_allowed
      self.tasks << task
    end

    Debug.debug "Printing tasks"
    print_tasks
  end

  def print_tasks
    self.tasks.each do |t|
      Debug.debug t
    end
  end
end
