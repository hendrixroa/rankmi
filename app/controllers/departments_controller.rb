class DepartmentsController < ApplicationController
  include Response

  def index
    @departments = Department.all
    json_response(@departments)
  end

  def update
  end

  def create
  end
end
