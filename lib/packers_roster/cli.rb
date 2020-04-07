class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "Welcome to the Packers Roster app!"
    puts "To learn more about your favorite players, enter:"
    puts "  1 - To search by name"
    puts "  2 - To search by number"
    puts "  3 - To search by position"
    
    input = gets.strip
    
   
    
    ### this is printing something out to make sure code is working
    # puts PackersRoster::Player.all[40].list_stats
    
    ### testing find_by_name method and list_stats
    PackersRoster::Player.find_by_name("Aaron Rodgers").list_stats
    
    ### testing find_by_position method
    PackersRoster::Player.find_by_position("WR").each {|p| puts p.name}

  end
  
end