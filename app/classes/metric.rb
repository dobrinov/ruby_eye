class Metric
  attr_reader :layer, :subject, :name

  def self.all
    Measurement.select(:layer, :subject, :name).distinct.map do |measurement|
      new(measurement[:layer], measurement[:subject], measurement[:name])
    end
  end

  def self.where(*args)
    Measurement.where(*args).select(:layer, :subject, :name).distinct.map do |measurement|
      new(measurement[:layer], measurement[:subject], measurement[:name])
    end
  end

  def initialize(layer, subject, name)
    @layer = layer
    @subject = subject
    @name = name
  end

  def to_s
    "#{layer}/#{subject}/#{name}"
  end
end
