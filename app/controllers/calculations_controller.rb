class CalculationsController < ApplicationController
  def add
    numbers = params[:numbers] || ""
    result = StringCalculator.add(numbers)
    render json: { result: result }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
