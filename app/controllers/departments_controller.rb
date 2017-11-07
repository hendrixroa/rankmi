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
    id_padre = params[:padre]
    department = Department.find_by(id: params[:id])
    id_padre_anterior = department.padre
    department.update(padre: id_padre)
    hijos = Department.where(padre: id_padre_anterior)
    padre_anterior = Department.where(id: id_padre_anterior)
    #actualizarse a si mismo
    cant_hijos = hijos.count
    if cant_hijos > 0
      sum_hijos = hijos.sum("nota") 
      total = sum_hijos/cant_hijos
      padre_anterior.update(nota: total)
    end
    papa = department.padre
    if Integer(papa) > 0
      while papa != 0 do  
        papa = update_nota papa
      end
    else
      papa = update_nota papa
    end
    json_response(papa)
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
    nota_body =  params[:nota]
    area_body = params[:area]
    department = Department.create(nota: nota_body, area: area_body, padre: params[:id])
    papa = params[:id]
    if Integer(params[:id]) > 0 #caso hijo lejano
      papa = params[:id]
      while papa != 0 do  
        papa = update_nota papa
      end
    else # ya el es el papa mayor
      papa = update_nota papa
    end
    json_response(papa)
  end
end