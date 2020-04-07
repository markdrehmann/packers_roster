class PackersRoster::Player
  attr_accessor :name, :number, :position, :height, :weight, :age, :experience, :college
  @@all = []
  
  
  def initialize(player_hash)
    player_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection
    players_array = PackersRoster::Scraper.scrape_roster
    players_array.each do |player_hash|
      PackersRoster::Player.new(player_hash)
    end
  end
  
  def list_stats
    puts name
    puts "  Number      #{number}"
    puts "  Position    #{position}"
    puts "  Height      #{height}"
    puts "  Weight      #{weight}"
    puts "  Age         #{age}"
    puts "  Experience  #{experience}"
    puts "  College     #{college}"
  end
  
  def self.find_by_name(name)
    self.all.detect{|player| player.name == name}
  end
  
  def self.find_by_number(number)
    self.all.detect{|player| player.number == number}
  end
  
  def self.find_by_position(position)
    self.all.select{|player| player.position == position}
  end

  def self.all
    @@all
  end
  
end