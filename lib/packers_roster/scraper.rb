class PackersRoster::Scraper
  
  SITE = "https://packers.com/team/players-roster"
  
  def self.scrape_roster
    doc = Nokogiri::HTML(open(SITE))
    array = []
    doc.css("tr").each do |p_page|
        info = p_page.text.strip.split(" ")
        p_name = info[0..1].join(" ")
        p_college = info[8..-1].join(" ")
        array << {name: p_name, number: info[2], position: info[3], height: info[4], weight: info[5], age: info[6], experience: info[7], college: p_college}
    end
    array.shift
    array
  end
  
end