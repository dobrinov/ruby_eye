require 'rails_helper'

RSpec.describe IndexesController do

  # GET show
  describe '#show' do
    it 'is 200' do
      get :show
      expect(response).to be_success
    end
  end
end
