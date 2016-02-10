class Layer
  attr_reader :name

  PHYSICAL    = 'physical'
  SERVICE     = 'service'
  APPLICATION = 'application'
  BUSINESS    = 'business'

  def self.all
    [PHYSICAL, SERVICE, APPLICATION, BUSINESS]
  end

  def initialize(name)
    @name = name
  end

  def metrics
    Metric.where(layer: name)
  end

  def measurements
    Measurement.where(layer: name)
  end
end
