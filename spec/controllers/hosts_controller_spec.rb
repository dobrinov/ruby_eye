require 'rails_helper'

RSpec.describe HostsController do

  # GET index
  describe '#index' do
    it 'is 200' do
      get :index
      expect(response).to be_success
    end
  end

  # GET show
  describe '#show' do
    it 'is 200' do
      get :show, id: 'example.com'
      expect(response).to be_success
    end
  end
end
