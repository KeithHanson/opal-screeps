require 'strategy_supervisor'
require 'military_supervisor'
require 'room_supervisor'

class WarSupervisor
  attr_accessor :supervisors, :strategy_supervisor, :military_supervisor, :room_supervisor


  def initialize
    self.supervisors = []

    self.strategy_supervisor = StrategySupervisor.shared
    self.military_supervisor = MilitarySupervisor.shared
    self.room_supervisor = RoomSupervisor.shared

    self.supervisors << strategy_supervisor
    self.supervisors << room_supervisor
    self.supervisors << military_supervisor
  end


  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("WarSupervisor Tick!")

    self.supervisors.each {|s| s.tick!}

    Debug.debug("WarSupervisor Tock!")
  end
end
