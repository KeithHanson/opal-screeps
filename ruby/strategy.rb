class Strategy
  attr_accessor :name

  def self.requirements
    { miner: 0, builder: 0, supplier: 0, upgrader: 0, healer: 0 }
  end
end
