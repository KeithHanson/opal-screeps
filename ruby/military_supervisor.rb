class MilitarySupervisor
  attr_accessor :war_supervisor

  def initialize
  end

  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("MilitarySupervisor Tick!")

    Debug.debug("MilitarySupervisor Tock!")
  end
end
