require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value('Estevam Ponte').for(:name) }
  it { is_expected.to allow_value('Rua joaquin, 560, parque municipio').for(:address) }
  it { is_expected.to allow_value('999999999').for(:phone)}
  it { is_expected.to allow_value('Fortaleza').for(:city)}
  it { is_expected.to allow_value(500).for(:escamboos)}

end
