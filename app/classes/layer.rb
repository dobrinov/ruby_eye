class Layer

  def self.all
    ['physical', 'service', 'application', 'business']
  end

  def initialize(name)
    @name = name
  end

  def metrics
    []
  end

  def measurements
    []
  end
end
