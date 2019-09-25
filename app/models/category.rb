class Category < ApplicationRecord
  include UniqueThroughTable
  belongs_to :vertical
end
