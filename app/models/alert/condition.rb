class Alert::Condition < ActiveRecord::Base
  belongs_to :policy

  enum period_type:         [:once_in, :for_at_least]
  enum period_measurement:  [:seconds, :minutes, :hours]
  enum comparison_operator: [:less_than, :less_than_or_equal_to, :equal_to, :greather_than_or_equal_to, :greather_than]

  def to_s
    <<-HTML.strip_heredoc.html_safe
      Alert if <strong>#{Metric.new(layer, subject, name).to_s}</strong>
      goes #{comparison_operator} #{warning_threshold} or #{critical_threshold}
      #{period_type} #{period_value} #{period_measurement}
    HTML
  end
end
