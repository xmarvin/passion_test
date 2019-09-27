require 'rails_helper'

RSpec.describe 'verticals', type: :request do
  context 'no user' do
    describe 'index' do
      it "returns 401" do
        get '/verticals.json'

        expect(response).to have_http_status(401)
      end
    end
  end
  context 'logged user' do
    let(:user) { User.create!(email: 'email@mail.com') }
    let!(:vertical) { FactoryBot.create(:vertical) }
    before do
      sign_in user
    end
    describe 'index' do
      it "returns 200" do
        get '/verticals.json'

        expect(response).to have_http_status(200)
        expect(json_body['records'].length).to eql(1)
        expect(json_body['records'][0]['id']).to eql(vertical.id)
      end
    end
  end
end