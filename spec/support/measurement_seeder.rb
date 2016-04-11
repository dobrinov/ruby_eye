class MeasurementSeeder
  attr_reader :hosts, :layers, :metrics, :measurements

  def initialize(number_of_hosts, metrics_per_layer, measurements_per_metric)
    @hosts   = build_hosts(number_of_hosts)
    @layers  = Layer.all
    @metrics = build_metrics(layers, metrics_per_layer)

    @measurements_per_metric = measurements_per_metric
  end

  def seed
    hosts.map do |host|
      metrics.each_with_index.map do |metric, metric_index|
        @measurements_per_metric.times.map do |measurement_index|
          uid = metric_index * @measurements_per_metric + measurement_index

          Measurement.create! host:      host.name,
                              layer:     metric.layer,
                              subject:   metric.subject,
                              name:      metric.name,
                              value:     uid,
                              timestamp: Time.at(uid)
        end
      end
    end.flatten
  end

  private

  def build_hosts(number_of_hosts)
    number_of_hosts.times.map { |i| Host.new("host_#{i}.example.com") }
  end

  def build_metrics(layers, metrics_per_layer)
    layers.map do |layer|
      metrics_per_layer.times.map do |i|
        Metric.new(layer, 'example_subject', "metric_name_#{i}")
      end
    end.flatten
  end
end
