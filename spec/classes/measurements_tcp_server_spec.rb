require 'rails_helper'

RSpec.describe MeasurementsTcpServer do
  let(:port) { 6666 }
  let(:bulk_import_size) { 2 }
  let(:measurements_tcp_server) { MeasurementsTcpServer.new(port, bulk_import_size) }

  describe '.start' do
    before do
      allow(described_class).to receive(:new).with(port, bulk_import_size).and_return(measurements_tcp_server)
    end

    it 'calls start on an instance' do
      expect(measurements_tcp_server).to receive(:start)
      described_class.start(port, bulk_import_size)
    end
  end

  describe '#start' do
    context 'when below bulk import limit' do
      it 'does not import any records' do
      end
    end
  end
end
