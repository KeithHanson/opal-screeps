require 'strategy_supervisor'
require 'military_supervisor'
require 'room'

class WarSupervisor
  attr_accessor :supervisors, :strategy_supervisor, :military_supervisor, :rooms


  def initialize
    self.supervisors = []

    self.strategy_supervisor = StrategySupervisor.shared
    self.military_supervisor = MilitarySupervisor.shared

    self.supervisors << strategy_supervisor
    self.supervisors << military_supervisor

    self.rooms = []
  end


  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("WarSupervisor Tick!")

    self.supervisors.each {|s| s.tick!}

    self.rooms = []

    GAME[:rooms].each do |room_name|
      self.rooms << Room.new(room_name)
    end

    self.rooms.each do |room|
      room.tick!
    end

    Debug.debug("WarSupervisor Tock!")
  end
end
