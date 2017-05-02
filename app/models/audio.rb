class Audio < ApplicationRecord
  validates :url, presence: true
  validates :length, presence: true
  validates :title, presence: true
  validates :date, presence: true
end
