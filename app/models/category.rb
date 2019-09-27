class Category < ApplicationRecord
  include UniqueThroughTable
  belongs_to :vertical

  scope :active, -> { where(state: :active)}
end
