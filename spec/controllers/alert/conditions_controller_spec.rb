require 'rails_helper'

RSpec.describe Alert::ConditionsController do

  let(:policy) { double(:policy, id: 123)}

  # GET index
  describe '#index' do
    it 'is 200' do
      get :index, policy_id: policy.id
      expect(response).to be_success
    end
  end

  # GET new
  describe '#new' do
    it 'is 200' do
      get :new, policy_id: policy.id
      expect(response).to be_success
    end
  end
end
