require 'rails_helper'

RSpec.describe Layer do
  let(:physical_layer)    { Layer.new(Layer::PHYSICAL)    }
  let(:service_layer)     { Layer.new(Layer::SERVICE)     }
  let(:application_layer) { Layer.new(Layer::APPLICATION) }
  let(:business_layer)    { Layer.new(Layer::BUSINESS)    }

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
    it 'returns an Array' do
      expect(described_class.all).to be_a(Array)
    end
  end

  describe '#metrics' do
    before { seeder.seed }

    it 'retunrs physical layer metrics' do
      expect(physical_layer.metrics.map(&:to_s).sort).to eq(seeder.physical_metrics.map(&:to_s).sort)
    end

    it 'retunrs service layer metrics' do
      expect(service_layer.metrics.map(&:to_s).sort).to eq(seeder.service_metrics.map(&:to_s).sort)
    end

    it 'retunrs application layer metrics' do
      expect(application_layer.metrics.map(&:to_s).sort).to eq(seeder.application_metrics.map(&:to_s).sort)
    end

    it 'retunrs business layer metrics' do
      expect(business_layer.metrics.map(&:to_s).sort).to eq(seeder.business_metrics.map(&:to_s).sort)
    end
  end

  describe '#measurements' do
    before { seeder.seed }

    it 'retunrs physical layer measurements' do
      expect(physical_layer.measurements.map(&:value).sort).to eq(seeder.physical_measurements.map(&:value).sort)
    end

    it 'retunrs service layer measurements' do
      expect(service_layer.measurements.map(&:value).sort).to eq(seeder.service_measurements.map(&:value).sort)
    end

    it 'retunrs application layer measurements' do
      expect(application_layer.measurements.map(&:value).sort).to eq(seeder.application_measurements.map(&:value).sort)
    end

    it 'retunrs business layer measurements' do
      expect(business_layer.measurements.map(&:value).sort).to eq(seeder.business_measurements.map(&:value).sort)
    end
  end
end
