class Debug
  def self.toggle_quiet
    @@quiet = !@@quiet 
    puts "Quiet Mode #{@@quiet ? "Activated" : "Deactivated"}"
  end

  def self.toggle_tasks
    @@tasks = !@@tasks 
    puts "Tasks Mode #{@@tasks ? "Activated" : "Deactivated"}"
  end

  def self.print_tasks
    @@tasks
  end

  def self.toggle
    @@debugging = !@@debugging
    puts "Debug Mode #{@@debugging ? "Activated" : "Deactivated"}"
  end

  def self.debugging
    @@debugging || false
  end

  def self.debug(msg)
    puts "(DEBUG) #{Time.now.strftime("%H:%M:%S")} | #{msg}" if self.debugging && !@@quiet
  end

  def self.always_log(msg)
    puts "#{Time.now.strftime("%H:%M:%S")} | #{msg}" unless @@quiet
  end

  def self.separator(msg)
    puts "*" * 10 + "(DEBUG: #{Debug.debugging} | #{Time.now.strftime("%H:%M:%S")}) #{msg}" + "*" * 10 unless @@quiet
  end
end
