require 'strategies/begin_strategy'
require 'task_manager'

class PopulationController
  attr_accessor :room, :creeps_by_parts, :capability_breakdown, 
                :task_manager

  def initialize(room)
    self.capability_breakdown = {}
    self.creeps_by_parts = {}
    self.room = room
    self.task_manager = TaskManager.new(self)

    self.refresh
  end

  def tick!
    Debug.debug("PopulationController Tick!")

    self.refresh

    self.generate_tasks

    self.task_manager.print_tasks

    self.task_manager.tick!

    Debug.debug("PopulationController Tock!")
  end

  def generate_tasks
    Debug.debug "Room #{self.room.name} Strategy: #{self.room.strategy.to_s} | Generating Tasks"

    unless self.room.strategy.nil?
      self.room.strategy.generate_tasks(self.capability_breakdown, self.room)
    end
  end

  def refresh
    analyze_capabilities
  end

  def analyze_capabilities
    self.creeps_by_parts = {}
    self.capability_breakdown = {}

    self.room.creeps.each do |creep|
      creep.body_parts.each do |part|
        self.creeps_by_parts[part] ||= []
        self.creeps_by_parts[part] << creep.name
      end

      creep_roles = analyze_creep(creep)

      creep_roles.each do |role|
        self.capability_breakdown[role] ||= []
        self.capability_breakdown[role] << creep.creep_name
      end
    end
  end

  def analyze_creep(creep)
    roles = []

    if creep.body_parts.include?("work") &&
       creep.body_parts.include?("carry") &&
       creep.body_parts.include?("move")
      roles << "miner"
    end

    return roles
  end

  def print_creeps_by_parts
    Debug.debug "Printing creeps by part:"
    Debug.debug self.creeps_by_parts
  end

  def print_capabilities
    Debug.debug "Printing Capabilities:"
    Debug.debug self.capability_breakdown
  end
end
