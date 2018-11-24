class ResourceSupervisor
  def self.shared
    @@supervisor ||= self.new
    @@supervisor
  end

  def tick!
    Debug.debug("ResourceSupervisor Tick!")


    Debug.debug("ResourceSupervisor Tock!")
  end

  def initialize
  end
end
