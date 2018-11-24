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

  def calculate_strategy
    Debug.debug("Calculating Strategy...")

    # Do some calculating stuff here

    Debug.debug("Strategy Calculated: #{self.strategy}")
  end

  def self.strategy
    self.shared.strategy
  end
end
