class Strategy
  attr_accessor :name

  def self.requirements
    { miner: 0, builder: 0, supplier: 0, upgrader: 0, healer: 0 }
  end

  def self.generate_tasks(capability_breakdown, room)
    Debug.debug "Attempted to call Strategy#generate_tasks from subclass without overriding"
  end
end
