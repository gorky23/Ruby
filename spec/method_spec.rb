# frozen_string_literal: true

def full_name(first_name, last_name)
  "#{first_name} #{last_name}"
end

describe 'test method' do
  it 'returns full name' do
    expect(full_name('Tomasz', 'Dziurman')).to eq 'Tomasz Dziurman'
  end

  it 'returns full name based on params' do
    expect(full_name('John', 'Doe')).to eq 'John Doe'
  end
end
