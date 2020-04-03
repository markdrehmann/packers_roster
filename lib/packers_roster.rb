require_relative "./packers_roster/version"
require_relative "./packers_roster/cli"
require_relative "./packers_roster/player"
require_relative "./packers_roster/scraper"
require_relative "./packers_roster/position"

require 'pry'
require 'nokogiri'

module PackersRoster
  class Error < StandardError; end
  # Your code goes here...
end
