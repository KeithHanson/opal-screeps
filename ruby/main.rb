require 'native'
require 'war_supervisor'

DEBUG = true

WORK = Native(`WORK`)
CARRY = Native(`CARRY`)
MOVE = Native(`MOVE`)

class ScreepsEntry
  def self.loop
    WarSupervisor.tick!

    game = Native(`Game`)

    creeps = []

    game[:creeps].each do |creep|
      creeps << creep
    end

    if creeps.nil? || creeps.length.nil? || creeps.length.to_i == 0
      puts "No creeps." if DEBUG

      game[:spawns]["Spawn1"].spawnCreep [WORK, CARRY, MOVE], "Creep"
    else
      puts "#{creeps.length.to_i} creeps." if DEBUG

      creeps.each do |creep_name|
        puts "\t#{creep_name}: #{game[:creeps][creep_name].ticksToLive}"
      end
    end

    puts "ScreepsEntry.loop() complete." if DEBUG
  end
end
