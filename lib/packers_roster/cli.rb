class PackersRoster::CLI
  def call
    
    # potention refactoring - create a #start method that gets called in #called
    # so the #call method is just "scrape, welcome, learn more, #start" - idea from 'worlds-best-restaurants'
    
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
        user_input = gets.strip
        if user_input == "Inigo Montoya"
          puts "You killed my father. Prepare to die.".red
        elsif PackersRoster::Player.find_by_name(user_input) == nil
          puts "Invalid entry".red
        else
          PackersRoster::Player.find_by_name(user_input).list_stats
        end
        puts "Would you like to run another search? y/n".green
        input = gets.strip
        if input == "y"
        elsif input == "n"
          input = "quit"
          puts "Go Pack!".green
        end
        
      elsif input == "2"
        puts "\nEnter the player's number".green
        user_input = gets.strip
        if PackersRoster::Player.find_by_number(user_input) == nil
          puts "Invalid entry".red
        else
          PackersRoster::Player.find_by_number(user_input).list_stats
        end
        puts "Would you like to run another search? y/n".green
        input = gets.strip
        if input == "y"
        elsif input == "n"
          input = "quit"
          puts "Go Pack!".green
        end
        
      elsif input == "3"
        positions = ["QB", "RB", "FB", "WR", "TE", "T", "G", "C", "LB", "S", "DL", "CB", "LS", "K", "P"]
        puts "\nEnter one of the following positions:".green
        puts "QB  RB  FB  WR  TE  T  G  C\nLB  S   DL  CB  LS  K  P".yellow
        user_input = gets.strip
        if positions.include?(user_input)
          PackersRoster::Player.all_at_position(user_input).each{|p| puts "#{p.name} - ##{p.number}".yellow}
        else
          puts "Invalid entry".red
        end
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
      
    end # closes until
    
  end # closes call method
  
end