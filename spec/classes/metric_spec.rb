require 'rails_helper'

RSpec.describe Metric do
  subject(:metric) { seeder.sample_metric }

  let(:number_of_hosts)         { 3 }
  let(:metrics_per_host)        { 2 }
  let(:measurements_per_metric) { 2 }

  let(:seeder) do
    MeasurementSeeder.new \
      number_of_hosts,
      metrics_per_host,
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

  describe '#to_s' do
    before { seeder.seed }

    it 'returns expected String' do
      expect(metric.to_s).to eq("#{metric.layer}/#{metric.subject}/#{metric.name}")
    end
  end
end
