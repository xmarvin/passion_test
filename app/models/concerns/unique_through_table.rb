module UniqueThroughTable
  extend ActiveSupport::Concern

  included do
    validate :validate_throw_tables

    def validate_throw_tables
      if [Vertical, Category].any?{| m| m.where(name: self.name).exists? }
        self.errors.add(:name, 'Not unique through tables')
      end
    end
  end
end