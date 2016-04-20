module Alert
  class ConditionManager
    include Virtus.model

    extend  ActiveModel::Naming
    include ActiveModel::Model
    include ActiveModel::Conversion
    include ActiveModel::Validations

    attr_reader :policy_id
    attr_reader :metric

    # Attributes
    attribute :policy_id,           Integer
    attribute :metric,              Metric
    attribute :comparison_operator, String
    attribute :warning_threshold,   Decimal
    attribute :critical_threshold,  Decimal
    attribute :period_type,         String
    attribute :period_value,        Integer
    attribute :period_measurement,  String

    def metric=(string)
      @metric = Metric.new_from_string(string)
    end

    def persisted?
      false
    end

    def save
      if valid?
        persist!
        true
      else
        false
      end
    end

    private

    def persist!
      policy = Policy.find(policy_id)
      condition = policy.conditions.create! \
        layer:               metric.layer,
        subject:             metric.subject,
        name:                metric.name,
        comparison_operator: comparison_operator,
        warning_threshold:   warning_threshold,
        critical_threshold:  critical_threshold,
        period_type:         period_type,
        period_value:        period_value,
        period_measurement:  period_measurement

    end
  end
end
