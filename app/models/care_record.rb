class CareRecord < ApplicationRecord
  validates :content, presence: true
end
