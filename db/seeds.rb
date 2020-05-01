# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.destroy_all
Show.destroy_all

channels_name = [ "RTÉ One",
                  "RTÉ One HD",
                  "RTÉ One +1",
                  "RTÉ2",
                  "RTÉ2 HD",
                  "RTÉ2+1",
                  "Virgin Media One",
                  "Virgin Media One +1",
                  "Virgin Media One HD",
                  "TG4",
                  "TG4 HD",
                  "Virgin Media Two",
                  "Virgin Media Two HD",
                  "Virgin Media Three",
                  "Virgin Media Three HD",
                  "Virgin Media Sport"
                ]

channels_name.each do |channel_name|
  channel = Channel.new(name: channel_name)

  next if channel.save

  puts 'Failed to build a seed channel:'
  pp channel.errors.full_messages
  pp channel
  exit 0

end


tv_shows_name = [
                  "Grand Canal Docks - Portobello",
                  "Portobello - Hazelhatch", 
                  "Hazelhatch - Henry Bridge",
                  "Henry Bridge - Sallins",
                  "Sallins - Lowtown",
                  "Lowtown - Littletown",
                  "Littletown - Allenwood",
                  "Allenwood - Trimblestown",
                  "Trimblestown - Rhode",
                  "Rhode - Killeen",
                  "Killeen - Daingean",
                  "Daingean - Ballycommon",
                  "Ballycommon - Pollagh",
                  "Pollagh - Belmont",
                  "Belmont - Shannon Harbour"
                ]

channel_ids = Channel.all.map(&:id)

tv_shows_name.each do |show_name|
  time = Time.at(rand(0..24).hour + rand(0..60).minutes)
  show = Show.new(channel_id: channel_ids.sample, name: show_name, timing: time)

  next if show.save

  puts 'Failed to build a seed Show:'
  pp show.errors.full_messages
  pp show
  exit 0
end