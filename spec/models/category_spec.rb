require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:vertical) { Vertical.create!(name: 'vertical-1') }
  describe 'validation' do
    let(:category) { Category.create(name: 'test', vertical: vertical) }
    context 'Vertical "test" exists' do
      before do
        Vertical.create!(name: 'test')
      end
      specify { expect(category.persisted?).to eql(false) }
    end
    context 'Category "test" exists' do
      before do
        Category.create!(name: 'test', vertical: vertical)
      end
      specify { expect(category.persisted?).to eql(false) }
    end
    context 'Category/Vertical "test" are not exist' do
      specify { expect(category.persisted?).to eql(true) }
    end
  end
end