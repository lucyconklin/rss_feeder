class Audio < ApplicationRecord
  validates :url, presence: true
  validates :length, presence: true
end
