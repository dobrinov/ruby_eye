class Index

  def self.metrics
    measurements.map(&:metric)
  end

  def self.measurements
    Measurement
      .select('DISTINCT ON (layer, subject, name, host) *')
      .order(:layer, :subject, :name, :host, timestamp: :desc).to_a
  end
end
