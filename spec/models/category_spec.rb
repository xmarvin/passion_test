require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:name) { 'test2' }
  let(:vertical) { Vertical.create!(name: 'some-vertical') }
  describe 'validation' do
    let(:category) { Category.create(name: name, vertical: vertical) }
    context 'Vertical with such name exists' do
      before do
        Vertical.create!(name: name)
      end
      specify { expect(category.persisted?).to eql(false) }
    end
    context 'Category with such name exists' do
      before do
        Category.create!(name: name, vertical: vertical)
      end
      specify { expect(category.persisted?).to eql(false) }
    end
    context 'Category/Vertical with such name are not exist' do
      specify { expect(category.persisted?).to eql(true) }
    end
  end
end