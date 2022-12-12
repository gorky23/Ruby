describe 'Navbar' do
  before do
    visit '/'
  end

  it 'has link to All friends' do
    expect(page).to have_link('Index')
  end

  it 'has link to school in friends' do
    expect(page).to have_link('School')
  end

  it 'has link to work in friends' do
    expect(page).to have_link('Work')
  end

  it 'has link to party in friends' do
    expect(page).to have_link('Party')
  end

  it 'has link to vacation in friends' do
    expect(page).to have_link('Vacation')
  end

  it 'has link to shop in friends' do
    expect(page).to have_link('Shop')
  end

  it 'has link to gym in friends' do
    expect(page).to have_link('Gym')
  end

  it 'has link to restaurant in friends' do
    expect(page).to have_link('Restaurant')
  end

  it 'has link to gallery in friends' do
    expect(page).to have_link('Gallery')
  end
end