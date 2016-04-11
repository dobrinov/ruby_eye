require 'rails_helper'

RSpec.describe Layer do
  let(:physical_layer)    { Layer.new(Layer::PHYSICAL)    }
  let(:service_layer)     { Layer.new(Layer::SERVICE)     }
  let(:application_layer) { Layer.new(Layer::APPLICATION) }
  let(:business_layer)    { Layer.new(Layer::BUSINESS)    }

  let(:layers) { [physical_layer, service_layer, application_layer, business_layer] }

  let(:number_of_hosts)         { 3 }
  let(:metrics_per_layer)       { 2 }
  let(:measurements_per_metric) { 2 }

  let(:measurements_per_layer) { number_of_hosts * metrics_per_layer * measurements_per_metric }

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

  describe '.all' do
    it 'returns layer count' do
      expect(described_class.count).to eq(4)
    end
  end

  describe '#metrics' do
    before { seeder.seed }

    it "retunrs layer metrics" do
      layers.each do |layer|
        expect(layer.metrics.count).to eq(metrics_per_layer)
        expect(layer.metrics.map(&:layer).uniq).to eq([layer.name])
      end
    end
  end

  describe '#measurements' do
    before { seeder.seed }

    it 'retunrs layer measurements' do
      layers.each do |layer|
        expect(layer.measurements.count).to eq(measurements_per_layer)
        expect(layer.measurements.map(&:layer).uniq).to eq([layer.name])
      end
    end
  end
end
