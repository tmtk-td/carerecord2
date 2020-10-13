class CareRecord < ApplicationRecord
  validates :content, presence: true
  belongs_to :client
end
