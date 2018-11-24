require 'room'
require 'threat_assessor'
require 'resource_supervisor'
require 'population_controller'

class RoomSupervisor
  attr_accessor :rooms, :supervisors

  def initialize
    self.supervisors = []
    self.rooms = []

    self.supervisors << ResourceSupervisor.shared
    self.supervisors << PopulationController.shared
  end

  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("RoomSupervisor Tick!")

    refresh

    self.supervisors.each {|s| s.tick!}

    self.rooms.each do |room|
      room.tick!
    end

    Debug.debug("RoomSupervisor Tock!")
  end

  def refresh
    self.rooms = []


    Native(`Game`)[:rooms].each do |room_name|
      new_room = Room.new(room_name)
      self.rooms << new_room
      ThreatAssessor.assess(new_room)
    end
  end
end
