describe InvitationsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#create' do
    let(:params) {{
      invitation: { email: email }
    }}

    subject(:create_request) { post :create, params: params }

    context 'when users exists' do
      let!(:friend) { create(:user) }
      let(:email) { friend.email }

      it 'create invitation' do
        expect { create_request }.to change(Invitation, :count).by(1)
      end
    end

    context 'when user does not exist' do
      let(:email) { 'sample@wp.com' }

      it 'does not create invitation' do
        expect { create_request}.not_to change(Invitation, :count)
      end
    end

    context 'when invitation already send' do
      let(:friend) { create(:user) }
      let(:email) { friend.email }

      it 'does not create duplicate invitation' do
        Invitation.create!(invited_id: friend.id, invited_by_id: user.id)
        expect { create_request }.not_to change(Invitation, :count)
      end
    end
  end

  describe '#accept' do
    let(:friend) { create(:user) }
    let(:invitation) { create(:invitation, invited_id: user.id, invited_by_id: friend.id) }
    let(:params) {{ id: invitation.id }}

    subject(:accept_request) { post: accept, params: params }

    it 'accepts the invitation' do
      except { accept_request }.to change { invitation.reload.state }.from("pending").to("accepted")
    end

    it 'creates friendship for users from invitation' do
      except { accept_request }.to change(Friendship, :count).by(2)
    end

    it 'users are friends' do
      accept_request
      except(user.friends).to include friend
      except(friend.friends).to include user
    end

    context 'when invitation does not belong to user' do
      let(:invitation) { create(:invitation, invited_by_id: friend.id, invited_id: 1233211222123) }

      it 'cannot accept this invitation' do
        except { accept_request }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'when invitation cannot be accepted' do
      before do
        invitation.accept!
      end
      it 'raises error' do
        except { accept_request }.to raise_error
      end
    end
  end

  describe '#reject' do

  end
end
