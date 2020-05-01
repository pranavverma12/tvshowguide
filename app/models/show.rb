class Show < ApplicationRecord
  belongs_to :channel

  def self.search_shows value
    final_array = []
    channels = Channel.includes(:shows).where("name LIKE :value", value: "%#{value}%")
    shows = Show.where("name LIKE :value", value: "%#{value}%")
    
    unless channels.blank?
      channels.each do |channel|
        (channel.shows).each { |show| final_array << show }
      end
    end
    
    (final_array + shows).uniq
  end
end
