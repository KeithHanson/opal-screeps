require 'strategy_supervisor'
require 'military_supervisor'
require 'room_supervisor'
require 'strategy_supervisor'

class WarSupervisor
  attr_accessor :supervisors, :military_supervisor, :room_supervisor, :strategy_supervisor

  def initialize
    self.supervisors = []

    self.military_supervisor = MilitarySupervisor.shared
    self.room_supervisor = RoomSupervisor.shared

    self.supervisors << self.room_supervisor
    self.supervisors << self.military_supervisor
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
