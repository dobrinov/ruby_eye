require 'rails_helper'

RSpec.describe Alert::PoliciesController do

  let(:policy) { double(:policy, id: 123) }

  before do
    allow(Alert::Policy).to receive(:find).and_return(policy)
  end

  # GET index
  describe '#index' do
    it 'is 200' do
      get :index
      expect(response).to be_success
    end

    it 'assigns @policies' do
      get :index
      expect(assigns(:policies)).not_to be_nil
    end
  end

  # GET new
  describe '#new' do
    it 'is 200' do
      get :new
      expect(response).to be_success
    end

    it 'assigns @policy' do
      get :new
      expect(assigns(:policy)).not_to be_nil
    end
  end

  # GET edit
  describe '#edit' do
    it 'is 200' do
      get :edit, id: policy.id
      expect(response).to be_success
    end

    it 'assigns @policy' do
      get :edit, id: policy.id
      expect(assigns(:policy)).not_to be_nil
    end
  end

  # GET show
  describe '#show' do
    it 'is 200' do
      get :show, id: policy
      expect(response).to be_success
    end

    it 'assigns @policy' do
      get :new
      expect(assigns(:policy)).not_to be_nil
    end
  end
end
