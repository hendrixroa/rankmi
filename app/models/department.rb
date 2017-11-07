
class Department < ApplicationRecord
    belongs_to :departments, :class_name => "Department", optional: true
end
