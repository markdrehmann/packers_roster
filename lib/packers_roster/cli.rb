class PackersRoster::CLI
  
  def call
    welcome_scrape
 
    @input = nil
    until @input == "quit"
      menu
      @input = gets.strip
      
      if @input == "1"
        search_by_name
        another_search
      elsif @input == "2"
        search_by_number
        another_search
      elsif @input == "3"
        search_by_position
        another_search
      elsif @input == "quit"
        puts "Go Pack!".green
      else
        puts "Invalid entry, can you try again?".red
      end
    end
  end
  
  def welcome_scrape
    PackersRoster::Player.create_from_collection(PackersRoster::Scraper.scrape_roster)
    puts "\nWelcome to the Packers Roster App!\n".green
    puts "To learn more about a player:".green
  end
  
  def menu
    puts "\n  Enter '1' to search by name".green
    puts "  Enter '2' to search by number".green
    puts "  Enter '3' to search by position\n".green
    puts "To end your search, type 'quit'".green
  end
  
  def another_search
    puts "Would you like to run another search? Y/N".green
    @input = gets.strip.upcase
    if @input == "Y"
    elsif @input == "N"
      @input = "quit"
      puts "Go Pack!".green
    end # technically this doesn't have an 'else', but if someone puts in wrong entry, they go to main menu anyway
  end
  
  def search_by_name
    puts "\nEnter the player's name".green
    name_input = gets.strip.upcase
    if name_input == "INIGO MONTOYA"
      puts "You killed my father. Prepare to die.".red
    elsif PackersRoster::Player.find_by_name(name_input) == nil
      puts "Invalid entry".red
    else
      PackersRoster::Player.find_by_name(name_input).list_stats
    end
  end
  
  def search_by_number
    puts "\nEnter the player's number".green
    number_input = gets.strip
    if PackersRoster::Player.find_by_number(number_input) == nil
      puts "Invalid entry".red
    else
      PackersRoster::Player.find_by_number(number_input).list_stats
    end
  end
  
  def search_by_position
    # should POSITIONS be a constant?
    positions = ["QB", "RB", "FB", "WR", "TE", "T", "G", "C", "LB", "S", "DL", "CB", "LS", "K", "P"]
    puts "\nEnter one of the following positions:".green
    puts "QB  RB  FB  WR  TE  T  G  C\nLB  S   DL  CB  LS  K  P".yellow
    pos_input = gets.strip.upcase
    if positions.include?(pos_input)
      PackersRoster::Player.all_at_position(pos_input).each{|p| puts "#{p.name} - ##{p.number}".yellow}
    else
      puts "Invalid entry".red
    end
  end
end