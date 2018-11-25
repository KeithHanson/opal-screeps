require 'creep'
require 'population_controller'

class Room
  attr_accessor :name, :creeps, :strategy, :energy_available,
                :energy_capacity_available, :spawns,
                :threat_level

  attr_accessor :population_controller, :resource_supervisor

  def initialize(name)
    self.name = name  

    self.creeps = []
    self.spawns = []
    self.strategy = nil
    self.energy_available = 0
    self.energy_capacity_available = 0

    self.population_controller = PopulationController.new(self)

    self.refresh

    Debug.debug "Loaded Room #{self.name}"
  end

  def refresh
    self.creeps = []
    self.spawns = []

    self.room_obj.find(FIND_MY_CREEPS).each do |creep_obj|
      self.creeps << Creep.new(creep_obj[:name])
    end

    self.room_obj.find(FIND_MY_SPAWNS).each do |spawn_obj|
      self.spawns << spawn_obj[:name]
    end

    self.energy_available = self.room_obj[:energyAvailable]
    self.energy_capacity_available = self.room_obj[:energyCapacityAvailable]
  end

  def room_obj
    Native(`Game`)[:rooms][self.name] 
  end

  def tick!
    self.refresh
    Debug.debug "Room #{self.name} tick!"

    self.population_controller.tick!

    self.creeps.each do |creep|
      creep.tick!
    end

    Debug.debug "Room #{self.name} tock!"
  end

  def self.get_room_by_name(name)
    Native(`Game`)[:rooms][name] 
  end
end
