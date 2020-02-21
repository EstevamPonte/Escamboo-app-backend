require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'include the correct concerns' do
    it { expect(controller.class.ancestors).to include(Authenticable) }
  end
end