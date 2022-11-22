describe 'Add new item' do
  before do
    visit '/'
  end

  it 'adds a new item' do
    click_link 'New item'
    expect(page).to have_content('New item')

    fill_in 'item_name', with: 'Władca Pierścieni'
    select 'book', from: 'item[item_type]'
    click_button 'Create Item'

    expect(page).to have_content('Item')
    item_name = page.find('#item_name').value
    item_type = page.find('#item_item_type').value
    expect(item_name).to eq 'Władca Pierścieni'
    expect(item_type).to eq 'book'

    click_link 'Back'
    expect(page).to have_content 'Władca Pierścieni'
    expect(page).to have_content 'book'
  end
end