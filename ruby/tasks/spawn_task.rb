require 'task'

class SpawnTask < Task
  def execute
    owner = self.get_owner
    puts "Executing Spawn Task #{self.id}"

    creeps_count = get_room.creeps.length

    owner.spawnCreep(self.data[:parts], "#{self.data[:prefix]}_#{rand(1..1000)}")
  end

  def get_owner
    if self.assigned_id.nil?
      room = self.get_room

      room.room_obj.find(FIND_MY_SPAWNS).each do |spawn_obj|
        self.assigned_id = spawn_obj[:name]
      end
    end

    return Native(`Game`).spawns[self.assigned_id]
  end

  def get_room
    return self.task_manager.population_controller.room
  end
end
