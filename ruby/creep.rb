class Creep
  attr_accessor :creep_obj, :name, :ttl

  def initialize(creep_object)
    self.creep_obj = creep_object

    self.name = self.creep_obj[:name]
    self.ttl = self.creep_obj[:ticksToLive]
  end
end
