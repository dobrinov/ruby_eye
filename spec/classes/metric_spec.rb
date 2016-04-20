require 'rails_helper'

RSpec.describe Metric do
  subject(:metric) { seeder.metrics.sample }

  let(:number_of_hosts)         { 3 }
  let(:metrics_per_layer)       { 2 }
  let(:measurements_per_metric) { 2 }

  let(:seeder) do
    MeasurementSeeder.new \
      number_of_hosts,
      metrics_per_layer,
      measurements_per_metric
  end

  describe '.all' do
    before { seeder.seed }

    it 'is an Array' do
      expect(described_class.all).to be_a(Array)
    end
  end

  describe '.where' do
    before { seeder.seed }

    it 'is an Array' do
      expect(described_class.where(layer: metric.layer, subject: metric.subject, name: metric.name)).to be_a(Array)
    end
  end

  describe '.new_from_string' do
    let(:layer) { 'layer' }
    let(:subj)  { 'subject' }
    let(:name)  { 'name' }

    let(:metric) { described_class.new(layer, subj, name).to_s }

    it 'is a new metric' do
      expect(Metric.new_from_string(metric)).to be_a(Metric)
    end

    it 'assigns attributes properly' do
      expect(Metric.new_from_string(metric).to_s).to eq(metric.to_s)
    end
  end

  describe '#to_s' do
    before { seeder.seed }

    it 'returns expected String' do
      expect(metric.to_s).to eq("#{metric.layer}/#{metric.subject}/#{metric.name}")
    end
  end
end
