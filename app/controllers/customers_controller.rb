class CustomersController < ApplicationController
  before_filter :get_customer, only: [:update]
  def create
    ActiveRecord::Base.transaction do
      @customer = Customer.new params[:customer]
      current_cart.associate_customer! @customer if @customer.save
    end
    render json: { errors: model_errors(@customer) }, status: :unprocessable_entity and return unless @customer.errors.empty?
    render json: { path: payment_path }, status: :ok
  end

  def update
    @customer.update_attributes params[:customer].slice(*Customer.saveable_attributes)
    render json: { errors: model_errors(@customer) }, status: :unprocessable_entity and return unless @customer.errors.empty?
    render json: { path: payment_path }, status: :ok
  end

  private

  def get_customer
    @customer = Customer.find params[:id]
  end
end