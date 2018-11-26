require 'room'

class StrategySupervisor
  def self.calculate_strategy_for_room(room)
    Debug.debug "Calculating Strategy for Room #{room.name}"

    room.strategy = BeginStrategy

    Debug.debug "Room Info: #{room.name} | Strategy: #{room.strategy.to_s} | #{room.energy_available}/#{room.energy_capacity_available} | #{room.spawns.length} spawns | #{room.creeps.length} creeps"
  end
end
