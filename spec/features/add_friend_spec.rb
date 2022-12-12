describe 'Add new friend' do
  before do
    visit '/'
  end

  it 'adds a new friend item' do
    click_link 'New friend'
    expect(page).to have_content('New friend')

    fill_in 'friend_name', with: 'Tomasz Zenobiusz'
    select 'restaurant', from: 'friend[place]'
    click_button 'Create Friend'

    fill_in 'friend_name', with: 'Zenon Martyniuk'
    select 'school', from: 'friend[place]'
    click_button 'Create Friend'

    fill_in 'friend_name', with: 'Marta Wywijalo'
    select 'work', from: 'friend[place]'
    click_button 'Create Friend'

    expect(page).to have_content('Friend details')
    friend_name = page.find('#friend_name').value
    friend_type = page.find('#friend_friend_types').value

    expect(friend_name).to eq 'Tadeusz Dziurman'
    expect(friend_type).to eq 'school'
  end
end