require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe "GET #index" do
    it "returns a JSON response with a list of authors" do
      author = FactoryBot.create(:author)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([JSON.parse(author.to_json)])
    end
  end

end
