class PackersRoster::CLI
  def call
    puts "Welcome to the Packers Roster app!"
    puts "For your favorite players' 2019 stats, enter:"
    puts "  1. To search by name"
    puts "  2. To search by number"
    puts "  3. To search by position"
    
    ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    ### this is printing something out to make sure code is working
    puts PackersRoster::Player.all[50].list_stats
    

  end
  
end