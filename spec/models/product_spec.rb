require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it { is_expected.to have_many(:likes).dependent(:destroy) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :user_id }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:escamboos) }
  it { is_expected.to respond_to(:category) }
  it { is_expected.to respond_to(:user_id) }
end
