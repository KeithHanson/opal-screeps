require 'task'

class MiningTask < Task
  def execute
    owner = self.get_owner

    Debug.debug "Executing MiningTask"
  end
end
