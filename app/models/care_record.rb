class CareRecord < ApplicationRecord
  validates :content, presence: true
  belongs_to :client
  has_many :comments, dependent: :destroy
end
