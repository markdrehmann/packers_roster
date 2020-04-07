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

  def add_player_stats
    stats_hash = PackersRoster::Scraper.scrape_profile(self.profile_url)
    stats_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end
  
  def list_stats
    puts @name
    puts @number
    puts @position
  end

  def self.all
    @@all
  end
  
end