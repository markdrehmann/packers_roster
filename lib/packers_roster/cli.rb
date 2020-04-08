class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "Welcome to the Packers Roster app!"
    
    input = ""
    until input == "4"
    puts "To learn more about your favorite players, enter:"
    puts "  1 - To search by name"
    puts "  2 - To search by number"
    puts "  3 - To search by position"
    puts "  4 - To quit"
    
      input = gets.strip
      if input == "1"
        puts "Enter the player's name"
        p_input = gets.strip
        PackersRoster::Player.find_by_name(p_input).list_stats
      elsif input == "4"
        puts "Thanks!"
      end
    end
      
    
    ### testing find_by_name method and list_stats
    # PackersRoster::Player.find_by_name("Aaron Rodgers").list_stats
    
    ### testing find_by_position method
    # PackersRoster::Player.find_by_position("WR").each {|p| puts p.name}

  end
  
end