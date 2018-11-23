class Debug
  DEBUG = true

  def self.debug(msg)
    puts "#{Time.now.strftime("%H:%M:%S")} | #{msg}" if DEBUG
  end

  def self.always_log(msg)
    puts "#{Time.now.strftime("%H:%M:%S")} | #{msg}"
  end

  def self.separator(msg)
    puts "*" * 10 + " #{msg} #{Time.now.strftime("%H:%M:%S")} " + "*" * 10
  end
end
