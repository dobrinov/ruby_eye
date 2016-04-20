module Alert
  class PoliciesController < ApplicationController
    def index
      @policies = Policy.all
    end

    def show
      @policy = Policy.find(params[:id])
    end

    def new
      @policy = Policy.new
    end

    def create
      @policy = Policy.new(alert_policy_params)

      if @policy.save
        redirect_to alert_policy_path(@policy)
      else
        render :new
      end
    end

    def edit
      @policy = Policy.find(params[:id])
    end

    def update
      @policy = Policy.find(params[:id])

      if @policy.update_attributes(alert_policy_params)
        redirect_to alert_policy_path(@policy)
      else
        render :edit
      end
    end

    def destroy
      policy = Policy.find(params[:id])
      policy.destroy
      redirect_to alert_policies_path
    end

    private

    def alert_policy_params
      if params[:alert_policy]
        params[:alert_policy].permit(:name, :description, :runbook)
      else
        {}
      end
    end
  end
end
