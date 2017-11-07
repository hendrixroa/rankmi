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

  def update_nota parent
    object_hijos = Department.where(padre: parent)
    sumatoria = object_hijos.sum("nota")
    cantidad = object_hijos.count
    nota_total = sumatoria/cantidad
    object_padre = Department.find_by(id: parent)
    object_padre.update(nota: nota_total)
    return object_padre.padre
  end

  def create
    #primero recalculamos
    nota_body =  5.3 #el que vendra en el post
    area_body = "Devops"
    department = Department.create(nota: nota_body, area: area_body, padre: params[:id])
    #recalcular las notas
    if Integer(params[:id]) > 0 #caso hijo lejano
      papa = params[:id]
      while papa != 0 do  
        papa = update_nota papa
      end
    else # ya el es el papa mayor
      update_nota papa
    end
    render json: "hola"
  end
end