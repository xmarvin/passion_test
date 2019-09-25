require 'rails_helper'

RSpec.describe Vertical, type: :model do
  describe 'validation' do
    let(:name) { 'test111' }
    let(:vertical) { Vertical.create(name: name) }
    context 'Vertical with such name exists' do
      before do
        FactoryBot.create(:vertical, name: name)
      end
      specify {
        expect(vertical.persisted?).to eql(false)
      }
    end
    context 'Category with such name exists' do
      before do
        FactoryBot.create(:category, name: name)
      end
      specify { expect(vertical.persisted?).to eql(false) }
    end
    context 'Category/Vertical with such name are not exist' do
      specify { expect(vertical.persisted?).to eql(true) }
    end
  end
end