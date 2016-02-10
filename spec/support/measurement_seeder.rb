class MeasurementSeeder
  def initialize(number_of_hosts, metrics_per_layer, measurements_per_metric)
    @number_of_hosts = number_of_hosts
    @metrics_per_layer = metrics_per_layer
    @measurements_per_metric = measurements_per_metric

    @base_timestamp = Time.now.to_i
    @global_measurement_index = 0
  end

  def metrics_per_host
    @metrics_per_layer * Layer.all.count
  end

  def measurements_per_host
    @measurements_per_metric * metrics_per_host
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

  def measurement_by_layer
    @_measurement_by_layer ||= {}
  end

  def physical_measurements
    measurement_by_layer[Layer::PHYSICAL] || []
  end

  def service_measurements
    measurement_by_layer[Layer::SERVICE] || []
  end

  def application_measurements
    measurement_by_layer[Layer::APPLICATION] || []
  end

  def business_measurements
    measurement_by_layer[Layer::BUSINESS] || []
  end

  def metrics_by_layer
    @_metrics_by_layer ||= {}
  end

  def physical_metrics
    metrics_by_layer[Layer::PHYSICAL] || []
  end

  def service_metrics
    metrics_by_layer[Layer::SERVICE] || []
  end

  def application_metrics
    metrics_by_layer[Layer::APPLICATION] || []
  end

  def business_metrics
    metrics_by_layer[Layer::BUSINESS] || []
  end

  def seed
    @number_of_hosts.times do |host_index|
      Layer.all.each do |layer|
        @metrics_per_layer.times do |metric_index|
          @measurements_per_metric.times do
            measurement = create_measurement measurement_host(host_index),
                                             layer,
                                             'subject',
                                             measurement_metric(metric_index),
                                             measurement_value,
                                             measurement_timestamp

            add_metric_to_layer(layer, measurement.metric)
            add_measurement_to_layer(layer, measurement)
            update_index(measurement.metric, measurement)
            increment_global_measurement_index
          end
        end
      end
    end
  end

  private

  def create_measurement(host, layer, subject, name, value, timestamp)
    Measurement.create! host:      host,
                        layer:     layer,
                        subject:   subject,
                        name:      name,
                        value:     value,
                        timestamp: timestamp
  end

  def add_metric_to_layer(layer, metric)
    metrics_by_layer[layer] ||= []

    unless metrics_by_layer[layer].map(&:to_s).include?(metric.to_s)
      metrics_by_layer[layer] << metric
    end
  end

  def add_measurement_to_layer(layer, measurement)
    measurement_by_layer[layer] ||= []
    measurement_by_layer[layer] << measurement
  end

  def update_index(metric, measurement)
    index_measurements[metric.to_s] = measurement
  end

  def increment_global_measurement_index
    @global_measurement_index += 1
  end

  def measurement_host(index)
    "host_#{index}.example.com"
  end

  def measurement_metric(index)
    "metric_#{index}"
  end

  def measurement_value
    @global_measurement_index
  end

  def measurement_timestamp
    Time.at(@base_timestamp + @global_measurement_index)
  end
end
