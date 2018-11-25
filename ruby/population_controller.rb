require 'strategies/begin_strategy'

class PopulationController
  attr_accessor :room, :creeps_by_parts, :capability_breakdown

  def initialize(room)
    self.capability_breakdown = {}
    self.creeps_by_parts = {}
    self.room = room

    self.refresh
  end

  def tick!
    Debug.debug("PopulationController Tick!")

    self.refresh

    self.generate_tasks

    Debug.debug("PopulationController Tock!")
  end

  def generate_tasks
    case StrategySupervisor.shared.strategy
    when "begin"
      Debug.debug "Executing Begin Strategy"

      BeginStrategy.generate_tasks(self.capability_breakdown)    
    else
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
