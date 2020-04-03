class PackersRoster::Scraper
  
  def self.scrape_roster(roster_url)
    doc = Nokogiri::HTML(open(roster_url))
    array = []
    doc.css("span.nfl-o-roster__player-name").each do |player|
      # each player needs name and profile within a hash to add to array - need to assign within iteration to have them in the same hash
      
      card.css(".student-card a").each do |student| # . is for class
        p_name = 
        # = student.css(".student-location").text
        p_profile = student.attr("href") # attr searches for "href" within 'student-card a'
        array << {:name => p_name, :profile_url => p_profile}
      end
    end
    array
  end
  
  
end