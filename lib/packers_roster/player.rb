class PackersRoster::Player
  attr_accessor :name, :number, :position, :height, :weight, :age, :experience, :college
  @@all = []
  
  def initialize(player_hash)
    player_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(players_array)
    players_array.each do |player_hash|
      PackersRoster::Player.new(player_hash)
    end
  end
  
  def list_stats
    puts "\n#{name}".yellow
    puts "  Number      #{number}".green
    puts "  Position    #{position}".green
    puts "  Height      #{height}".green
    puts "  Weight      #{weight}".green
    puts "  Age         #{age}".green
    puts "  Experience  #{experience}".green
    puts "  College     #{college}\n".green
  end
  
  def self.find_by_name(name)
    self.all.detect{|player| player.name.upcase == name}
  end
  
  def self.find_by_number(number)
    self.all.detect{|player| player.number == number}
  end
  
  def self.all_at_position(position)
    self.all.select{|player| player.position == position}
  end

  def self.all
    @@all
  end
  
end
