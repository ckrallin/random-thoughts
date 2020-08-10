class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode
  has_many :thoughts

  validates :location, :presence => true
  validates :start, :presence => true

  attr_reader :dates

  def dates
    if self.start.nil?
      return ""
    elsif self.end == self.start || self.end.nil?
      return "#{convert(self.start)}"
    else
      return "#{convert(self.start)} - #{convert(self.end)}"
    end
  end

  def convert(date)
    d = Date.parse(date.to_s)
    return "#{d.month}/#{d.day}/#{d.year}"
  end

end
