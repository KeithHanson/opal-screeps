require 'creep'

class Room
  attr_accessor :name, :creeps
  def initialize(name)
    self.name = name  

    self.creeps = []

    self.screeps_room.find(FIND_MY_CREEPS).each do |creep_obj|
      self.creeps << Creep.new(creep_obj[:name])
    end

    Debug.debug "Loaded #{self.creeps.length} creeps in room #{self.name}"
  end

  def screeps_room
    Native(`Game`)[:rooms][self.name] 
  end

  def tick!
    Debug.debug "Room #{self.name} tick!"

    self.creeps.each do |creep|
      creep.tick!
    end

    Debug.debug "Room #{self.name} tock!"
  end
end
