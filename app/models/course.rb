class Course < ApplicationRecord
  belongs_to :category

  scope :active, -> { where(state: :active)}
end
