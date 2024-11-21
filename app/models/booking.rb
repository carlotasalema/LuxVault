class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :start_date, :end_date, :status, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted', 'available'] }
  validates :end_date, comparison: { greater_than: :start_date }
end
