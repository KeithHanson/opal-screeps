class TaskManager
  attr_accessor :population_controller, :tasks

  def initialize(population_controller)
    self.tasks = []
    self.population_controller = population_controller
  end

  def add_task(task, duplicates_allowed = 1)
    Debug.debug "TaskManager: Adding task: #{task}"

    desired_tasks = self.tasks.select {|t| t.name == task.name} || []

    Debug.debug "desired_tasks: #{desired_tasks.length} | duplicates_allowed: #{duplicates_allowed}"

    if duplicates_allowed >= 1 && 
       desired_tasks.length < duplicates_allowed
      
      task.task_manager = self
      self.tasks << task
    end
  end

  def tick!
    self.tasks.each do |task|
      unless task.completed
        task.execute
      end
    end
  end

  def print_tasks
    if Debug.print_tasks
      Debug.always_log "[#{self.population_controller.room.name}] Task Count: #{self.tasks.length}"
      self.tasks.each do |t|
        Debug.always_log t
      end
    end
  end
end

