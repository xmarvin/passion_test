require 'rails_helper'

RSpec.describe 'categories', type: :request do
  context 'logged user' do
    let(:user) { User.create!(email: 'email@mail.com') }
    let!(:vertical1) { FactoryBot.create(:vertical) }
    let!(:vertical2) { FactoryBot.create(:vertical) }
    let!(:category11) { FactoryBot.create(:category, vertical: vertical1) }
    let!(:category12) { FactoryBot.create(:category, vertical: vertical1) }
    let!(:category21) { FactoryBot.create(:category, vertical: vertical2) }
    before do
      sign_in user
    end
    describe 'index' do
      it "returns 200" do
        get '/categories.json', params: { vertical_id: vertical1.id }

        expect(response).to have_http_status(200)
        expect(json_body['records'].length).to eql(2)
        expect(json_body['records'].map{|r| r['id']}.sort).to eql([category11.id, category12.id].sort)
      end
    end
  end
end