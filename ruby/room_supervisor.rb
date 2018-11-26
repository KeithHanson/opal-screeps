require 'room'
require 'threat_assessor'
require 'strategy_supervisor'

class RoomSupervisor
  attr_accessor :rooms

  def initialize
    self.rooms = []

    self.refresh
  end

  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("RoomSupervisor Tick!")

    refresh

    self.rooms.each do |room|
      StrategySupervisor.calculate_strategy_for_room(room)
      room.tick!
    end

    Debug.debug("RoomSupervisor Tock!")
  end

  def refresh
    self.rooms = []


    Native(`Game`)[:rooms].each do |room_name|
      room_obj = Room.get_room_by_name(room_name)

      unless room_obj[:controller].nil?
        new_room = Room.new(room_name)
        new_room.threat_level = ThreatAssessor.assess(new_room)

        self.rooms << new_room
      end
    end
  end
end
