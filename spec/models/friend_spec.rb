describe Friend, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:surname).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:place).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to define_enum_for(:place).with_values(Friend.places) }
    it { is_expected.to validate_length_of(:name).is_at_least(3) }
    it { is_expected.to validate_length_of(:surname).is_at_least(5) }
    it { is_expected.to validate_length_of(:email).is_at_least(5) }
  end
end