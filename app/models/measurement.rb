class Measurement < ActiveRecord::Base
  def self.batch_insert_columns
    ['layer', 'host', 'subject', 'name', 'value', 'timestamp']
  end

  def batch_insert_values
    [layer, host, subject, name, value.to_f, timestamp]
  end

  def self.build_from_json(measurement)
    if measurement['timestamp'].is_a?(Fixnum)
      measurement['timestamp'] = Time.at(measurement['timestamp'])
    end

    new(measurement)
  end

  def metric
    Metric.new(layer, subject, name)
  end
end
