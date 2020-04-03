class PackersRoster::Scraper
  
  def self.scrape_roster(roster_url)
    doc = Nokogiri::HTML(open(roster_url))
    array = []
    doc.css("span.nfl-o-roster__player-name").each do |player|
      p_name = player.text
      p_profile = player.attr("href")
      array << {:name => p_name, :profile_url => p_profile}
    end
    array
  end
      
      # each player needs name and profile within a hash to add to array - need to assign within iteration to have them in the same hash
      
end