class StaffInfo < ApplicationRecord
  belongs_to :user
  validates :info, presence: true
end
