class State
  OK       = :ok
  WARNING  = :warning
  CRITICAL = :critical
  EXPIRED  = :expired

  def self.all
    [OK, WARNING, CRITICAL, EXPIRED]
  end
end
