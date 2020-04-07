class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "Welcome to the Packers Roster app!"
    puts "For your favorite players' 2019 stats, enter:"
    puts "  1. To search by name"
    puts "  2. To search by number"
    puts "  3. To search by position"
    
   
    
    ### this is printing something out to make sure code is working
    puts PackersRoster::Player.all[40].list_stats
    
    # PackersRoster::Player.find_by_name("Devin Funchess").list_stats

  end
  
end