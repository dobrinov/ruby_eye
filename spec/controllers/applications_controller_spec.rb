require 'rails_helper'

RSpec.describe ApplicationsController do

  # GET index
  describe '#index' do
    it 'is 200' do
      get :index
      expect(response).to be_success
    end
  end
end
