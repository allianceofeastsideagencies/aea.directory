#!/usr/bin/env ruby
require 'open-uri'
require 'icalendar'
require 'fileutils'
require 'time'
require 'cgi'

# Constants
ICAL_URL = "https://kidvantagenw.org/events/?ical=1"
AGENCY_NAME = "KidVantage"
OUTPUT_DIR = "_events"

# Create the output directory if needed
FileUtils.mkdir_p(OUTPUT_DIR)

# Fetch and parse the iCal feed
ics_data = URI.open(ICAL_URL).read
calendars = Icalendar::Calendar.parse(ics_data)
calendar = calendars.first

# Current date to filter past events
today = Date.today

# Process each event
calendar.events.each do |event|
  next if event.dtstart.to_date < today # skip past events

  start_date = event.dtstart.to_time
  end_date = event.dtend&.to_time
  title = event.summary.strip
  location = event.location ? event.location.strip : "TBD"
  url = event.url ? event.url.to_s.strip : ICAL_URL
  description = event.description ? event.description.strip : "Details forthcoming."

  # Generate a filename-safe title
  safe_title = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-|-$/, '')
  filename = "#{start_date.strftime('%Y-%m-%d')}-#{safe_title}.md"

  # Construct frontmatter and body with proper formatting
  content = <<~MARKDOWN
    ---
    title: "#{title.gsub('"', '\"')}"
    agency: "#{AGENCY_NAME}"
    start_date: "#{start_date.strftime('%Y-%m-%d %H:%M:%S')}"
    end_date: "#{end_date ? end_date.strftime('%Y-%m-%d %H:%M:%S') : ''}"
    location: "#{location.gsub('"', '\"')}"
    more_info_url: "#{url}"
    ---
    #{description.strip}
  MARKDOWN

  # Ensure UTF-8 encoding and no BOM
  File.write(File.join(OUTPUT_DIR, filename), content.encode("UTF-8"))
  puts "✅ Created: #{filename}"
end

puts "🎉 All future events have been written to the #{OUTPUT_DIR} directory."
