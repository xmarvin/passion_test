class CoursesController < ApplicationController
  def index
    @courses = Course.paginate(page: params[:page]).order(created_at: :desc)
  end
end
