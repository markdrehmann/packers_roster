class PackersRoster::CLI
  def call
    
     ### this is my scraping to create players and their stats
    PackersRoster::Scraper.scrape_roster
    PackersRoster::Player.create_from_collection
    
    puts "\nWelcome to the Packers Roster App!\n".green
    puts "To learn more about a player:".green
    input = ""
    until input == "quit"
    puts "\n  Enter '1' to search by name".green
    puts "  Enter '2' to search by number".green
    puts "  Enter '3' to search by position\n".green
    puts "To end your search, type 'quit'".green
    
      input = gets.strip
      if input == "1"
        puts "\nEnter the player's name".green
        p_input = gets.strip
        PackersRoster::Player.find_by_name(p_input).list_stats
        puts "Would you like to run another search? y/n".green
        input = gets.strip
        if input == "y"
        elsif input == "n"
          input = "quit"
          puts "Go Pack!".green
        end
      elsif input == "2"
        puts "\nEnter the player's number".green
        p_input = gets.strip
        PackersRoster::Player.find_by_number(p_input).list_stats
        puts "Would you like to run another search? y/n".green
        input = gets.strip
        if input == "y"
        elsif input == "n"
          input = "quit"
          puts "Go Pack!".green
        end
      elsif input == "3"
        puts "\nEnter one of the following positions:".green
        puts "QB  RB  FB  WR  TE  T  G  C\nLB  S   DL  CB  LS  K  P".yellow
        p_input = gets.strip
        PackersRoster::Player.all_at_position(p_input).each{|p| puts "#{p.name} - ##{p.number}".yellow}
        puts "Would you like to run another search? y/n".green
        input = gets.strip
        if input == "y"
        elsif input == "n"
          input = "quit"
          puts "Go Pack!".green
        end
      elsif input == "quit"
        puts "Go Pack!".green
      else
        puts "Invalid entry, can you try again?".red
      end
    end
    
  end
  
end