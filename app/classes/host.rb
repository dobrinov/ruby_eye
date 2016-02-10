class Host
  attr_reader :name

  def self.all
    Measurement.pluck('DISTINCT host').map { |name| new(name) }
  end

  def initialize(name)
    @name = name
  end

  def metrics
    Metric.where(host: name).to_a
  end

  def measurements
    Measurement.where(host: name).to_a
  end
end
