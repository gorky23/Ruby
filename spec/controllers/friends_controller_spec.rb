describe FriendsController, type: :controller do
  describe 'GET #index' do
    subject(:index_request) { get :index }
    it 'returns http success' do
      index_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      index_request
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:friend) { create(:friend) }
    subject(:show_request) { get :show, params: { id: friend.id } }
    it 'returns http success' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'show template' do
      show_request
      expect(response).to render_template('show')
    end
  end

  describe 'Get #new' do
    subject(:new_request) { get :new }
    it 'returns http success' do
      new_request
      expect(response).to have_http_status(:ok)
    end

    it 'render new template in app friend' do
      new_request
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    let(:friend) { create(:friend) }
    subject(:edit_request) { get :edit, params: { id: friend.id } }

    it 'returns http success' do
      edit_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders edit template' do
      edit_request
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    let(:friend) { build(:friend) }
    subject(:create_request) { post :create, params: { friend: friend.attributes } }

    it 'returns https redirect' do
      create_request
      expect(response).to have_http_status(302)
    end

    it 'redirects to new friend' do
      create_request
      expect(response).to redirect_to(friend_path(Friend.last))
    end
  end

  describe 'PUT #update' do
    let(:friend) { create(:friend) }
    let(:new_attributes) { attributes_for(:friend) }
    subject(:update_request) { put :update, params: { id: friend.id, friend: new_attributes } }

    it 'returns https redirect' do
      update_request
      expect(response).to have_http_status(302)
    end

    it 'redirects to update friend' do
      update_request
      expect(response).to redirect_to(friend_path(friend))
    end
  end

  describe 'DELETE #destroy' do
    let(:friend) { create(:friend) }
    subject(:destroy_request) { delete :destroy, params: { id: friend.id } }

    it 'returns https redirect' do
      destroy_request
      expect(response).to have_http_status(302)
    end

    it 'redirects to index in friend' do
      destroy_request
      expect(response).to redirect_to(friends_path)
    end
  end

  describe 'GET #school' do
    subject(:school_request) { get :school }
    it 'returns http success' do
      school_request
      expect(response).to have_http_status(:ok)
    end

    it 'render school template' do
      school_request
      expect(response).to render_template('school')
    end
  end

  describe 'GET #work' do
    subject(:work_request) { get :work }
    it 'returns http success' do
      work_request
      expect(response).to have_http_status(:ok)
    end

    it 'render work template' do
      work_request
      expect(response).to render_template('work')
    end
  end

  describe 'GET #party' do
    subject(:party_request) { get :party }
    it 'returns http success' do
      party_request
      expect(response).to have_http_status(:ok)
    end

    it 'render party tamplate' do
      party_request
      expect(response).to render_template('party')
    end
  end

  describe 'GET #vacation' do
    subject(:vacation_request) { get :vacation }
    it 'returns http success' do
      vacation_request
      expect(response).to have_http_status(:ok)
    end

    it 'render vacation template' do
      vacation_request
      expect(response).to render_template('vacation')
    end
  end

  describe 'GET #shop' do
    subject(:shop_request) { get :shop }
    it 'returns http success' do
      shop_request
      expect(response).to have_http_status(:ok)
    end

    it 'render shop template' do
      shop_request
      expect(response).to render_template('shop')
    end
  end

  describe 'GET #gym' do
    subject(:gym_request) { get :gym }
    it 'returns http success' do
      gym_request
      expect(response).to have_http_status(:ok)
    end

    it 'render gym template' do
      gym_request
      expect(response).to render_template('gym')
    end
  end

  describe 'GET #restaurant' do
    subject(:restaurant_request) { get :restaurant }
    it 'returns http success' do
      restaurant_request
      expect(response).to have_http_status(:ok)
    end

    it 'render restaurant template' do
      restaurant_request
      expect(response).to render_template('restaurant')
    end
  end

  describe 'GET #gallery' do
    subject(:gallery_request) { get :gallery }
    it 'returns http success' do
      gallery_request
      expect(response).to have_http_status(:ok)
    end

    it 'render gallery template' do
      gallery_request
      expect(response).to render_template('gallery')
    end
  end
end