require 'room'

class StrategySupervisor
  attr_accessor :strategy

  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("StrategySupervisor Tick!")

    calculate_strategy

    Debug.debug("StrategySupervisor Tock!")
  end

  def initialize
    self.strategy = "begin"
  end

  def calculate_strategy_for_room(room)
    puts "Calculating Strategy for Room #{room.name}"

    room.strategy = BeginStrategy

    puts "Room Info: #{room.name} | Strategy: #{room.strategy.to_s} | #{room.energy_available}/#{room.energy_capacity_available} | #{room.spawns.length} spawns | #{room.creeps.length} creeps"

  end

  def calculate_strategy
    Debug.debug("Calculating Strategy...")

    RoomSupervisor.shared.rooms.each do |room|
      self.calculate_strategy_for_room(room)
    end

    Debug.debug("Strategy Calculated: #{self.strategy}")
  end

  def self.strategy
    self.shared.strategy
  end
end
