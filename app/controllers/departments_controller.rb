class DepartmentsController < ApplicationController
  include Response

  def armar_jerarquia array_buffer, departments, padre
    departments.select { |item| item[:padre] == padre }.each do |item|
      array_buffer << { 
        id: item[:id],
        area: item[:area],
        nota: item[:nota],
        hijos: armar_jerarquia([], departments, item[:id])
    }
    end
      array_buffer
  end

  def index
    @departments = Department.all
    @jerarquia = armar_jerarquia [], @departments, 0
    json_response(@jerarquia)
  end

  def update
    render json: params[:id]
  end

  def create
  end
end