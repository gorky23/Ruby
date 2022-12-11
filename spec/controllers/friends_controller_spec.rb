describe FriendsController, type: :controller do
  describe 'GET #index' do
    it 'returns hhtp success' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:friend) { create(:friend) }
    it 'returns http success' do
      get :show, params: { id: friend.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Get #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    let(:friend) { create(:friend) }

    it 'returns http success' do
      get :edit, params: { id: friend.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:friend) { build(:friend) }

    it 'returns https success' do
      post :create, params: { friend: friend.attributes }
      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT #update' do
    let(:friend) { create(:friend) }
    let(:new_attributes) { attributes_for(:friend) }

    it 'returns https redirect' do
      put :update, params: { id: friend.id, friend: new_attributes }
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE #delete' do
    let(:friend) { create(:friend) }

    it 'returns https redirect' do
      delete :destroy, params: { id: friend.id }
      expect(response).to have_http_status(302)
    end
  end
end