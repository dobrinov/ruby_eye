class Measurement < ActiveRecord::Base
  def self.batch_insert_columns
    ['layer', 'host', 'subject', 'metric', 'value', 'timestamp']
  end

  def self.build_from_json(measurement)
    if measurement['timestamp'].is_a?(Fixnum)
      measurement['timestamp'] = Time.at(measurement['timestamp'])
    end

    new(measurement)
  end

  def batch_insert_values
    [layer, host, subject, metric.to_f, value, timestamp]
  end
end
