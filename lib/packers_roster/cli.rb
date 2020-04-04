class PackersRoster::CLI
  def call
    puts "Welcome to the Packers Roster app!"
    puts "For your favorite players' 2019 stats, enter:"
    puts "  1. To search by name"
    puts "  2. To search by number"
    puts "  3. To search by position"
    
    PackersRoster::Scraper.scrape_roster
    
    PackersRoster::Player.all
    
    

    

  end
  
end