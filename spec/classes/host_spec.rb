require 'rails_helper'

RSpec.describe Host do
  subject(:host) { Host.new(seeder.sample_host_name) }

  let(:number_of_hosts)         { 3 }
  let(:metrics_per_layer)       { 1 }
  let(:measurements_per_metric) { 2 }

  let(:seeder) do
    MeasurementSeeder.new \
      number_of_hosts,
      metrics_per_layer,
      measurements_per_metric
  end

  describe '.all' do
    before { seeder.seed }

    it 'returns all hosts' do
      all_hosts = described_class.all

      expect(all_hosts).to be_a(Array)
      expect(all_hosts.map(&:name).uniq.count).to eq(number_of_hosts)
    end
  end

  describe '#metrics' do
    before { seeder.seed }

    it 'returns host metrics' do
      host_metrics = host.metrics

      expect(host_metrics).to be_a(Array)
      expect(host_metrics.map(&:class).map(&:name).uniq).to eq(['Metric'])
      expect(host_metrics.map(&:to_s).uniq.count).to eq(seeder.metrics_per_host)
    end
  end

  describe '#measurements' do
    before { seeder.seed }

    it 'returns host measurements' do
      host_measurements = host.measurements

      expect(host_measurements).to be_a(Array)
      expect(host_measurements.map(&:class).map(&:name).uniq).to eq(['Measurement'])
      expect(host_measurements.count).to eq(seeder.measurements_per_host)
    end
  end
end
