class StrategySupervisor
  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.always_log("StrategySupervisor Tick!")

    calculate_strategy

    Debug.always_log("StrategySupervisor Tock!")
  end

  def initialize
    @@strategy = "build"
  end

  def calculate_strategy
    Debug.always_log("Calculating Strategy...")

    # Do some calculating stuff here


    Debug.always_log("Strategy Calculated: #{@@strategy}")
  end

  def self.strategy
    @@strategy
  end
end
