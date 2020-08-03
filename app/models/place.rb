class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode
end
