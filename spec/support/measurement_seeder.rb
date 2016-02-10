class MeasurementSeeder
  def initialize(number_of_hosts, metrics_per_host, measurements_per_metric)
    @number_of_hosts = number_of_hosts
    @metrics_per_host = metrics_per_host
    @measurements_per_metric = measurements_per_metric
  end

  def sample_host_name
    index_measurements[sample_metric.to_s].host
  end

  def sample_metric
    index_metrics.first
  end

  def index_metrics
    index_measurements.map { |k,v| v.metric }
  end

  def index_measurements
    @_index_measurements ||= {}
  end

  def seed
    timestamp = Time.now.to_i
    global_measurement_index = 0

    @number_of_hosts.times do |host_index|
      @metrics_per_host.times do |metric_index|
        @measurements_per_metric.times do
          measurement = Measurement.create! host:      "host_#{host_index}.example.com",
                                            layer:     "physical",
                                            subject:   "system",
                                            name:      "metric_#{metric_index}",
                                            value:     global_measurement_index,
                                            timestamp: Time.at(timestamp + global_measurement_index)

          index_measurements[measurement.metric.to_s] = measurement

          global_measurement_index += 1
        end
      end
    end
  end
end
