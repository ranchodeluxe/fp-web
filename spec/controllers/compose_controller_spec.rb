require 'rails_helper'

RSpec.describe ComposeController, type: :controller do
  describe 'POST #create' do
    context 'user is saved on compose and renders on atlas detail' do
      it 'creates the atlas and redirects to atlas "show"' do
        @user = create(:user)
        sign_in @user
        post :create, atlas: attributes_for(:atlas)
        Rails.logger.debug("[ RESPONSE ]: #{response}")
        expect(Atlas.count).to eq(1)
        expect(response).to redirect_to Atlas.first
        expect(response.body).to include("<h4>Activity</h4>")
      end
    end
  end
end
