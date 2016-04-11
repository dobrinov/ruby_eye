require 'rails_helper'

RSpec.describe Index do
  subject(:index) { described_class }

  let(:number_of_hosts)         { 3 }
  let(:metrics_per_layer)       { 2 }
  let(:measurements_per_metric) { 2 }

  let(:index_size) { number_of_hosts * Layer.count * metrics_per_layer }

  let(:seeder) do
    MeasurementSeeder.new \
      number_of_hosts,
      metrics_per_layer,
      measurements_per_metric
  end

  describe '.metrics' do
    before { seeder.seed }

    it 'returns all metrics in the Index' do
      index_metrics = index.metrics

      expect(index_metrics).to be_a(Array)
      expect(index_metrics.map(&:class).map(&:name).uniq).to eq(['Metric'])
      expect(index_metrics.count).to eq(index_size)
    end
  end

  describe '.measurements' do
    before { seeder.seed }

    it 'returns the latest measurements of all metrics in the Index' do
      index_measurements = index.measurements

      expect(index_measurements).to be_a(Array)
      expect(index_measurements.map(&:class).map(&:name).uniq).to eq(['Measurement'])
      expect(index_measurements.count).to eq(index_size)
    end
  end
end
