class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "\nWelcome to the Packers Roster App!\n".green
    puts "To learn more about a player:\n".green
    input = ""
    until input == "quit"
    puts "  Enter '1' to search by name".green
    puts "  Enter '2' to search by number".green
    puts "  Enter '3' to search by position\n".green
    puts "To end your search, type 'quit'".green
    
      input = gets.strip
      if input == "1"
        puts "\nEnter the player's name".green
        p_input = gets.strip
        PackersRoster::Player.find_by_name(p_input).list_stats
      elsif input == "2"
        puts "\nEnter the player's number".green
        p_input = gets.strip
        PackersRoster::Player.find_by_number(p_input).list_stats
      elsif input == "3"
        puts "\nEnter a position".green
        p_input = gets.strip
        PackersRoster::Player.all_at_position(p_input).each{|p| puts p.name.yellow}
      elsif input == "quit"
        puts "Go Pack!".green
      else
        puts "Invalid entry, can you try again?".red
      end
    end
      
    
    
  end
  
end