class CategoriesController < ApplicationController
  def index
    @categories = Category.active
    if params[:vertical_id].present?
      @categories = @categories.where(vertical_id: params[:vertical_id])
    end
    @categories = @categories.paginate(page: params[:page]).order(created_at: :desc)
  end
end
