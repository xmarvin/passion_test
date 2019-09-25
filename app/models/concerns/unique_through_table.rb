module UniqueThroughTable
  extend ActiveSupport::Concern
  MODELS = [Category, Vertical]

  included do
    validate :validate_throw_tables
  end

  def validate_throw_tables
    if MODELS.any?{| m| m.where(name: self.name).exists? }
      self.errors.add(:name, 'Not unique through tables')
    end
  end
end