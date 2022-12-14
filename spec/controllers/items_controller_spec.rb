# frozen_string_literal: true

describe ItemsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:index_request) { get :index }

    it 'returns https success' do
      index_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders of index template' do
      index_request
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    subject(:show_request) { get :show, params: { id: item.id } }

    let(:item) { create(:item, user: user) }

    it 'returns http success' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the show template' do
      show_request
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    subject(:new_request) { get :new }

    it 'returns http success' do
      new_request
      expect(response).to have_http_status(:ok)
    end

    it 'Render the new template' do
      new_request
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    subject(:edit_request) { get :edit, params: { id: item.id } }

    let(:item) { create(:item, user: user) }

    it 'returns http success' do
      edit_request
      expect(response).to have_http_status(:ok)
    end

    it 'Render the edit template' do
      edit_request
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    subject(:create_request) { post :create, params: { item: item.attributes } }

    let(:item) { build(:item, user: user) }

    it 'returns http redirect' do
      create_request
      expect(response).to have_http_status(:found)
    end

    it 'Redirects to the new item' do
      create_request
      expect(response).to redirect_to(item_path(Item.last))
    end

    it 'creates a new item' do
      expect { create_request }.to change(Item, :count).by(1)
    end
  end

  describe 'PUT #update' do
    subject(:update_request) { put :update, params: { id: item.id, item: new_attributes } }

    let(:item) { create(:item, user: user) }
    let(:new_attributes) { attributes_for(:item) }

    it 'returns http redirect' do
      update_request
      expect(response).to have_http_status(:found)
    end

    it 'Redirects to the updated item' do
      update_request
      expect(response).to redirect_to(item_path(item))
    end

    it 'updates item' do
      expect { update_request }.to change { item.reload.name }.to(new_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_request) { put :update, params: { id: item.id, item: new_attributes } }

    let!(:item) { create(:item, user: user) }
    let(:new_attributes) { attributes_for(:item) }

    it 'returns http redirect' do
      delete_request
      expect(response).to have_http_status(:found)
    end

    it 'Redirect to the items index' do
      delete_request
      expect(response).to redirect_to(item_path)
    end

    it 'delete the item' do
      expect { delete_request }.to change(Item, :count).by(0)
    end
  end

  describe 'GET #active' do
    it 'returns https success' do
      get :active
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #inactive' do
    it 'returns https success' do
      get :inactive
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #borrowed' do
    it 'returns https success' do
      get :borrowed
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #on_place' do
    it 'returns https success' do
      get :on_place
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Get #active' do
    subject(:active_request) { get :active }

    it 'returns http success' do
      active_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the active template' do
      active_request
      expect(response).to render_template('active')
    end
  end

  describe 'Get #inactive' do
    subject(:inactive_request) { get :inactive }

    it 'returns http success' do
      inactive_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the inactive template' do
      inactive_request
      expect(response).to render_template('inactive')
    end
  end

  describe 'Get #borrowed' do
    subject(:borrowed_request) { get :borrowed }

    it 'returns http success' do
      borrowed_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the borrowed template' do
      borrowed_request
      expect(response).to render_template('borrowed')
    end
  end

  describe 'Get #on_place' do
    subject(:on_place_request) { get :on_place }

    it 'returns http success' do
      on_place_request
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the on_place template' do
      on_place_request
      expect(response).to render_template('on_place')
    end
  end
end
