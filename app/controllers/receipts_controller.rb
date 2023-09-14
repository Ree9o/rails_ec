# frozen_string_literal: true

class ReceiptsController < ApplicationController
  before_action :set_receipts
  before_action :basic_auth
  def index; end

  def show
    @receipt = @receipts.find_by(checkout_id: params[:id])
  end

  private

  def set_receipts
    @receipts = Receipt.select('checkout_id, ARRAY_AGG(name) as names, ARRAY_AGG(price) as prices, ARRAY_AGG(quantity) as quantities').group('checkout_id').order('checkout_id')
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
