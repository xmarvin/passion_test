class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page]).order(created_at: :desc)
  end
end
