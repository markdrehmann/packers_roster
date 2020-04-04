class PackersRoster::Scraper
  
  def self.scrape_roster
    doc = Nokogiri::HTML(open("https://packers.com/team/players-roster"))
    array = []
    doc.css("span.nfl-o-roster__player-name a").each do |player|
      p_name = player.text
      p_profile = player.attr("href")
      array << {:name => p_name, :profile_url => p_profile}
    end
    array
  end
  
  # each player needs name and profile within same hash to add to array 
  # need to assign within one iteration to have them in the same hash
  
  def self.scrape_profile(profile_url)
    p_site = "https://www.packers.com" + profile_url
    doc = Nokogiri::HTML(open(p_site))
    
    position = doc.css("h3.d3-o-media-object__primary-subtitle").text.strip
    number = doc.css("h3.d3-o-media-object__secondary-subtitle").text.strip.delete("#")
  
    stats = doc.css("span.nfl-t-stats-tile__label-full").map do |stat|
      stat.text.to_sym
    end

    stat_value = doc.css("div.nfl-t-stats-tile__value").map do |value|
      value.text.strip
    end

    stats_hash = Hash[stats.zip(stat_value)]
    stats_hash[:position] = position
    stats_hash[:number] = number
    stats_hash
  end
end

