module Alert
  class ConditionsController < ApplicationController
    def new
      @condition_manager = ConditionManager.new(policy_id: params[:policy_id])
    end

    def create
      @condition_manager = ConditionManager.new(conditions_manager_params)

      if @condition_manager.save
        redirect_to alert_policy_path(@condition_manager.policy_id)
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def conditions_manager_params
      if params[:alert_condition_manager].present?
        params[:alert_condition_manager].permit \
          :metric,
          :comparison_operator,
          :warning_threshold,
          :critical_threshold,
          :period_type,
          :period_value,
          :period_measurement,
          :condition_id,
          :policy_id
      else
        {}
      end
    end
  end
end
