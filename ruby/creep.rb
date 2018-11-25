class Creep
  attr_accessor :creep_name, :name, :ttl, :hits, :hits_max, :fatigue, 
                :current_task, :body_parts

  def initialize(name)
    self.creep_name = name
    self.current_task = nil

    self.refresh
  end

  def creep_obj
    Native(`Game`)[:creeps][self.creep_name]
  end

  def refresh
    self.name = self.creep_obj[:name]
    self.ttl = self.creep_obj[:ticksToLive]
    self.hits = self.creep_obj[:hits]
    self.hits_max = self.creep_obj[:hitsMax]
    self.fatigue = self.creep_obj[:fatigue]
  end

  def body_parts
    @body_parts ||= self.creep_obj.body.map do |part|
      part[:type].to_s
    end

    @body_parts
  end

  def tick!
    self.refresh
    Debug.debug "Creep #{self.name} tick!"
    Debug.debug self
    Debug.debug "Creep #{self.name} tock!"
  end

  def to_s
    begin
      "Game.creeps['#{self.name}']: #{self.hits}/#{self.hits_max}HP | #{self.ttl} TTL | #{self.fatigue} FAT"
    rescue
    end
  end
end
