require 'strategy_supervisor'

class WarSupervisor
  def initialize
  end

  def self.shared
    @@supervisor ||= self.new
  end

  def tick!
    Debug.always_log("WarSupervisor Tick!")

    StrategySupervisor.shared.tick!   

    Debug.always_log("WarSupervisor Tock!")
  end
end
