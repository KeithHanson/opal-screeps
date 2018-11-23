class StrategySupervisor
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
    @@strategy = "begin"
  end

  def calculate_strategy
    Debug.debug("Calculating Strategy...")

    # Do some calculating stuff here

    Debug.debug("Strategy Calculated: #{@@strategy}")
  end

  def self.strategy
    @@strategy
  end
end
