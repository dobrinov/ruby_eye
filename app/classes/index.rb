class Index

  def self.metrics
    measurements.map(&:metric)
  end

  def self.measurements
    Measurement
      .select('DISTINCT ON (layer, subject, name) *')
      .order(:layer, :subject, :name, timestamp: :desc).to_a
  end
end
