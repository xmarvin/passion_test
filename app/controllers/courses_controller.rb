class CoursesController < ApplicationController
  def index
    @courses = Course.active
    if params[:category_id].present?
      @courses = @courses.where(category_id: params[:category_id])
    end
    @courses = @courses.paginate(page: params[:page]).order(created_at: :desc)
  end
end
