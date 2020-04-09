class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "\nWelcome to the Packers Roster app!\n".green
    puts "To learn more about your favorite players, enter:".green
    
    input = ""
    until input == "quit"
    puts "  1 - To search by name".green
    puts "  2 - To search by number".green
    puts "  3 - To search by position".green
    puts "To quit at any time, type 'quit'".green
    
      input = gets.strip
      if input == "1"
        puts "Enter the player's name".green
        p_input = gets.strip
        PackersRoster::Player.find_by_name(p_input).list_stats
      elsif input == "2"
        puts "Enter the player's number".green
        p_input = gets.strip
        PackersRoster::Player.find_by_number(p_input).list_stats
      elsif input == "3"
        puts "Enter a position".green
        p_input = gets.strip
        PackersRoster::Player.all_at_position(p_input).each{|p| puts p.name}
      elsif input == "quit"
        puts "Thanks!".green
      else
        puts "I'm sorry, can you try again?".green
      end
    end
      
    
    
  end
  
end