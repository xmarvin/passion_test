class VerticalsController < ApplicationController
  def index
    @verticals = Vertical.paginate(page: params[:page]).order(created_at: :desc)
  end
end
