class ThreatAssessor
  def self.assess(room)
    Debug.debug "ThreatAssessor assessing threat level for #{room.name}..."

    level = 0

    Debug.debug "ThreatAssessment: #{level}"

    return level # dumb 100 point scale right now
  end
end
