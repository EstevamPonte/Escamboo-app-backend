require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:product) }

  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :product_id }

  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:product_id) }
end
