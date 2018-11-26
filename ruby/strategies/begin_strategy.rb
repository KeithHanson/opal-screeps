require 'strategy'
require 'task_manager'
require 'tasks/spawn_task'

class BeginStrategy < Strategy
  def self.requirements
    { miner: 5, builder: 0, supplier: 0, upgrader: 0, healer: 0 }
  end

  def self.generate_tasks(capabilities, room)
    Debug.debug "Generating tasks for room #{room.name}"
    task_manager = room.population_controller.task_manager

    Debug.debug "BeginStrat: Generating Tasks."

    Debug.debug "Capabilities: "
    Debug.debug capabilities

    Debug.debug "Requirements: "
    Debug.debug self.requirements

    if capabilities == {}
      Debug.debug "Bootstrapper Needed!"

      task = SpawnTask.new("bootstrapper", {parts: [WORK, CARRY, MOVE], prefix: "bootstrapper", room_name: room.name} )

      task_manager.add_task(task, 1)
    end

    self.requirements.each_pair do |role, count|
      capabilities_for_role = (capabilities[role].nil? ? [] : capabilities[role])

      if count > 0 && capabilities_for_role.length < count
        Debug.debug "count: #{count} | role: #{role} | capabilities[role]: #{capabilities_for_role.length}"
        Debug.debug "Creating Task to Spawn: #{role}"

        real_count = count - capabilities_for_role.length

        real_count.times do
          self.create_spawn_task(role, real_count, room)
        end
      end
    end
  end

  def self.create_spawn_task(role, count, room)
    task = SpawnTask.new(role, {parts: [WORK, CARRY, MOVE], prefix: "miner", room_name: room.name} )
    room.population_controller.task_manager.add_task(task, count)
  end
end
