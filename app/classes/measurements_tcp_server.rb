require 'json'
require 'logger'
require 'socket'

class MeasurementsTcpServer

  def self.start(port, bulk_import_size=1)
    new(port, bulk_import_size).start
  end

  def initialize(port, bulk_import_size)
    @tcp_server = TCPServer.new(port)

    @bulk_import_batch = []
    @bulk_import_size = bulk_import_size.to_i
  end

  def start
    logger.info('Listening for measurements...')
    loop { handle_request }
  end

  private

  def handle_request
    Thread.start(@tcp_server.accept) do |client|
      while payload = client.gets
        Measurement.build_from_json(JSON.parse(payload)).tap do |measurement|
          record(measurement)
        end
      end

      client.close
    end
  end

  def record(measurement)
    begin
      @bulk_import_batch << measurement

      if batch_size_limit_reached?
        Measurement.import(@bulk_import_batch)
        logger.info("Imported #{@bulk_import_batch.size} measurements.")
        @bulk_import_batch.clear
      end
    rescue => e
      logger.error e.message
      logger.error e.backtrace
    end
  end

  def batch_size_limit_reached?
    @bulk_import_batch.size >= @bulk_import_size
  end

  def logger
    @_logger = Logger.new(STDOUT)
  end
end
