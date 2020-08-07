class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode

  validates :location, :presence => true
  validates :start, :presence => true

  attr_reader :dates

  def dates
    if self.end == self.start || self.end.nil?
      return "#{self.start}"
    else
      return "#{self.end} - #{self.start}"
    end
  end

end
