require 'setup'
require 'task_manager'

class ScreepsEntry
  def self.loop
    Debug.separator("begin loop")

    WarSupervisor.shared.tick!

    Debug.separator("end loop")
  end
end

# this class' loop method is called from main.js 
